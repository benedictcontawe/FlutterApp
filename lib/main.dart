import 'package:dart_http/bindings/splash_binding.dart';
import 'package:dart_http/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/route_manager.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  await dotenv.load(fileName : Environment.mode); //TODO: Problem with this in android but in Web is OK. Still Fixing

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