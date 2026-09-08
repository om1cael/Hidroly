import java.io.FileInputStream
import java.util.Properties
import com.android.build.api.variant.FilterConfiguration.FilterType.ABI
import org.jetbrains.kotlin.gradle.dsl.JvmTarget

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

    defaultConfig {
        applicationId = "com.om1cael.hidroly"
        minSdk = 26
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

kotlin {
    compilerOptions {
        jvmTarget = JvmTarget.fromTarget("17")
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

androidComponents {
    onVariants { variant ->
        variant.outputs.forEach { output ->
            val abi = output.filters
                .find { it.filterType == ABI }
                ?.identifier

            val abiVersionCode = abiCodes[abi]

            if (abiVersionCode != null) {
                val baseVersionCode = output.versionCode.get()
                output.versionCode.set(
                    baseVersionCode * 10 + abiVersionCode
                )
            }
        }
    }
}

afterEvaluate {
    apply(from = "../no-build-id.gradle")
}