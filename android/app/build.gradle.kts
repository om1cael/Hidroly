import java.util.Properties
import java.io.FileInputStream
import com.android.build.gradle.internal.api.ApkVariantOutputImpl

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
val hasKeystore = keystorePropertiesFile.exists()

if (hasKeystore) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.om1cael.hidroly"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "28.2.13676358"

    dependenciesInfo {
        includeInApk = false
        includeInBundle = false
    }

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.om1cael.hidroly"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    if (hasKeystore) {
        signingConfigs {
            create("release") {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = keystoreProperties["storeFile"]?.let { file(it) }
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        debug {
            isDebuggable = true
        }
        release {
            isDebuggable = false
            if (hasKeystore) {
                signingConfig = signingConfigs.getByName("release")
            }
        }
    }

    flavorDimensions += "release"

    productFlavors {
        create("fdroid") {
            dimension = "release"
        }
        create("default") {
            dimension = "release"
        }
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

flutter {
    source = "../.."
}

val abiCodes = mapOf(
    "armeabi-v7a" to 2,
    "arm64-v8a" to 3
)

android.applicationVariants.configureEach {
    if(flavorName == "fdroid") {
        val variant = this
        variant.outputs.forEach { output ->
            val abiVersionCode = abiCodes[output.filters.find { it.filterType == "ABI" }?.identifier]
            if (abiVersionCode != null) {
                (output as ApkVariantOutputImpl).versionCodeOverride = variant.versionCode * 10 + abiVersionCode
            }
        }
    } else {
        outputs.all {
            val outputImpl = this as com.android.build.gradle.internal.api.ApkVariantOutputImpl
            val abiFilter = outputImpl.getFilter(com.android.build.OutputFile.ABI)
            val abiVersionCode = abiFilter?.let { abiCodes[it] }
            if (abiVersionCode != null) {
                outputImpl.versionCodeOverride = versionCode * 10 + abiVersionCode
            }
        }
    }
}