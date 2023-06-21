import 'package:dart_sqflite/bindings/splash_binding.dart';
import 'package:dart_sqflite/util/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/route_manager.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  await dotenv.load(fileName : Environment.mode);
  debugPaintSizeEnabled = false;
  runApp (
    GetMaterialApp (
      debugShowCheckedModeBanner: true,
      initialBinding: SplashBinding(),
      initialRoute: Routes.SPLASH,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    )
  );
}