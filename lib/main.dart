import 'package:dart_media_query/bindings/splash_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: true,
    initialBinding: SplashBinding(),
    initialRoute: Routes.SPLASH,
    theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ));
}