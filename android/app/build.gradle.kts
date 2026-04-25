import java.util.Properties
import java.io.FileInputStream
import com.android.build.gradle.internal.api.ApkVariantOutputImpl

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")

val keyAliasVar = if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
    keystoreProperties["keyAlias"] as String
} else {
    System.getenv("KEY_ALIAS") ?: ""
}

val keyPasswordVar = if (keystorePropertiesFile.exists()) {
    keystoreProperties["keyPassword"] as String
} else {
    System.getenv("KEY_PASSWORD") ?: ""
}

val storePasswordVar = if (keystorePropertiesFile.exists()) {
    keystoreProperties["storePassword"] as String
} else {
    System.getenv("KEYSTORE_PASSWORD") ?: ""
}

val storeFileVar = if (keystorePropertiesFile.exists()) {
    keystoreProperties["storeFile"]?.let { file(it) }
} else {
    file("upload-keystore.jks") 
}

val canSign = keyAliasVar.isNotEmpty() && keyPasswordVar.isNotEmpty()

android {
    namespace = "com.om1cael.hidroly"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    dependenciesInfo {
        includeInApk = false
        includeInBundle = false
    }

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.om1cael.hidroly"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        if (canSign) {
            create("release") {
                keyAlias = keyAliasVar
                keyPassword = keyPasswordVar
                storeFile = storeFileVar
                storePassword = storePasswordVar
            }
        }
    }

    buildTypes {
        release {
            if (canSign) {
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