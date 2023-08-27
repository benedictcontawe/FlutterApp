import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_storage/bindings/base_binding.dart';
import 'package:getx_storage/controllers/object_controller.dart';
import 'package:getx_storage/firebase/firebase_storage_service.dart';
import 'package:getx_storage/firebase/firestore_service.dart';
import 'package:getx_storage/util/get_storage_manager_.dart';

class ObjectBinding extends BaseBinding {
  
 @override
  void dependencies() {
    debugPrint("ObjectBinding dependencies");
    Get.lazyPut<ObjectController> ( 
      () => ObjectController (
        Get.find<GetStorageManager>(),
        Get.find<FirestoreService>(),
        Get.find<FirebaseStorageService>(),
      )
    );
  }  
}