import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:get_x/core/routes/app_pages.dart';

Future<void> main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.LOGIN,
    theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ));
}
