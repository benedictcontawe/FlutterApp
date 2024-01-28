import 'package:dart_camera/bindings/splash_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  //#region Camera Initialized
  WidgetsFlutterBinding.ensureInitialized();
  //#endregion
  debugPaintSizeEnabled = false;
  runApp ( GetMaterialApp (
    debugShowCheckedModeBanner: true,
    initialBinding: SplashBinding(),
    initialRoute: Routes.SPLASH,
    theme: ThemeData (
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ) );
}