import 'dart:io';
import 'package:dart_hive/bindings/splash_binding.dart';
import 'package:dart_hive/models/custom_model.dart';
import 'package:dart_hive/util/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/route_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'routes/app_pages.dart';

Future<void> main() async {
  await dotenv.load(fileName : Environment.mode);
  await Hive.initFlutter();
  debugPaintSizeEnabled = false;
  //WidgetsFlutterBinding();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive..init(directory.path)..registerAdapter(CustomModelAdapter());
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