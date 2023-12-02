import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:navigation_drawer/binders/splash_binding.dart';
import 'package:navigation_drawer/routes/app_pages.dart';

Future<void> main() async {
  debugPaintSizeEnabled = false;
  runApp ( 
    GetMaterialApp (
      debugShowCheckedModeBanner: false,
      initialBinding: SplashBinding(),
      initialRoute: Routes.SPLASH,
      theme: ThemeData (
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.lightGreen.shade300,
        primarySwatch: Colors.lightGreen
      ),
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    ) 
  );
}