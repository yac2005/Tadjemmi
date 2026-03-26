plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.agri_community"
    compileSdk = 34
    
    // FORCE the build tools version to match what we found in your SDK folder
    buildToolsVersion = "34.0.0"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.example.agri_community"
        // Using manual numbers here to ensure stability in Codespaces
        minSdk = 21
        targetSdk = 34
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // Using debug keys so you can build without a keystore file for now
            signingConfig = signingConfigs.getByName("debug")
            
            minifyEnabled = false
            shrinkResources = false
        }
    }
}

flutter {
    source = "../.."
}