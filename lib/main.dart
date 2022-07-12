import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_x/bindings/CustomBinding.dart';
import 'routes/app_pages.dart';


Future<void> main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialBinding: CustomBinding(),
    initialRoute: Routes.CUSTOM,
    theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ));
}