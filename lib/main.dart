import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:getx_storage/bindings/splash_binding.dart';
import 'package:getx_storage/firebase/firebase_options.dart';
import 'package:getx_storage/firebase/firebase_storage_service.dart';
import 'package:getx_storage/firebase/firestore_service.dart';
import 'package:getx_storage/util/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/app_pages.dart';
import 'util/get_storage_manager_.dart';

Future<void> main() async {
  debugPaintSizeEnabled = false;
  await dotenv.load(fileName : Environment.mode);
  //#region Get X Storage
  await GetStorage.init();
  Get.put(GetStorageManager());
  //#endregion
  //#region Firebase
  //WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(FirestoreService());
  Get.put(FirebaseStorageService());
  //#endregion
  runApp ( 
    GetMaterialApp (
      debugShowCheckedModeBanner: true,
      initialBinding: SplashBinding(),
      initialRoute: Routes.SPLASH,
      theme: ThemeData (
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    ) 
  );
}