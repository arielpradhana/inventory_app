plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services")  // ✅ Plugin Firebase
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.inventory_app"
    compileSdk = 33

    defaultConfig {
        applicationId = "com.example.inventory_app"
        minSdk = 21
        targetSdk = 33
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    buildTypes {
        release {
            signingConfig signingConfigs.debug
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation platform('com.google.firebase:firebase-bom:32.2.2')
    implementation 'com.google.firebase:firebase-analytics-ktx'
    // Tambahkan dependency Firebase lain di sini
}
