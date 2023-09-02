import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class FirebaseStorageService extends GetxService {

  final storageRef = FirebaseStorage.instance.ref();

  Reference? imagesRef;
  Reference? videosRef;

  FirebaseStorageService() {
    imagesRef = storageRef.child('images/');
    videosRef = storageRef.child('videos/');
  }

  Future<TaskSnapshot?> uploadPlatformFiles(PlatformFile? file) async {
    debugPrint("uploadPlatformFiles ${file?.name} ${file?.size}");
    if (file != null && file?.name == null || file?.bytes == null) {
      throw Exception("File is Null");
    }
    bool isImage = file?.extension?.toLowerCase()?.contains("jpg") == true || file?.extension?.toLowerCase()?.contains("png") == true || file?.extension?.toLowerCase()?.contains("webp") == true;    
    if(isImage = true) {
      return await imagesRef?.child(file!.name).putData(file.bytes!);
    } else {
      return await videosRef?.child(file!.name).putData(file.bytes!);
    }
  }

  Future<void> deleteFile(String? icon) async {
    //TODO: when deleting or editing image need to delete the uploaded file
    //imagesRef?.delete();
  }
}