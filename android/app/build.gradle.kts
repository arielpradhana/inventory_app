plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services")  // Firebase plugin
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.inventory_app"
    compileSdk = 34  // Updated to more recent version
    
    defaultConfig {
        applicationId = "com.example.inventory_app"
        minSdk = 21
        targetSdk = 34  // Updated to match compileSdk
        versionCode = 1
        versionName = "1.0"
    }
    
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17  // Updated to Java 17
        targetCompatibility = JavaVersion.VERSION_17  // Updated to Java 17
    }
    
    kotlinOptions {
        jvmTarget = "17"  // Updated to match Java version
    }
    
    buildTypes {
        getByName("release") {
            // Fixed syntax for Kotlin DSL
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation(platform("com.google.firebase:firebase-bom:32.7.0"))  // Updated BOM version
    implementation("com.google.firebase:firebase-analytics-ktx")
    // Add other Firebase dependencies here as needed
}