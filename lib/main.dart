import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/core/di/injection.dart';
import 'package:stray_dog_adoption/core/router/app_router.dart';
import 'package:stray_dog_adoption/firebase_options.dart';
import 'package:stray_dog_adoption/my_app.dart';

bool isWallpaperColorPickingSupported = false;

AppRouter appRouter = AppRouter();

const kAdminUid = '0fFBdb8jE4dBRfc4K609yiB1Jfl2';

abstract class MainApp {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    /// injection init
    await configureInjection();

    runApp(const MyApp());
  }
}

void main() {
  MainApp.run();
}
