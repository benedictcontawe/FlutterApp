import 'dart:io';

import 'package:dart_http/controllers/base_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

class MainController extends BaseController {

  MainController() {
    debugPrint("MainController Constructor");
  }

  final RxBool _isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> onPickFiles(bool allowMultiple) async {
    final result = await pickFiles(allowMultiple);
    if (allowMultiple == false && result != null) {
      final file = result.files.first;
      openFile(file);
    } else if (allowMultiple == true && result != null) {
      /*
      List<PlatformFile> files = result.paths.map(  (path) =>
        File(path)
      ).toList()
      */
    }
  }

  Future<FilePickerResult?> pickFiles(bool allowMultiple) async {
    if (allowMultiple == false) {
      return await FilePicker.platform.pickFiles();
    } else {
      return await FilePicker.platform.pickFiles(allowMultiple: true);
    }
  }

  void openFile(PlatformFile file) {
    debugPrint("MainController openFile(PlatformFile name ${file.name})");
    debugPrint("MainController openFile(PlatformFile size ${file.size})");
    debugPrint("MainController openFile(PlatformFile extension ${file.extension})");
    //debugPrint("MainController openFile(PlatformFile path ${file.path})");
    debugPrint("MainController openFile(PlatformFile bytes ${file.bytes})");
    OpenFile.open(file.path);
  }

  void openFiles(List<PlatformFile> file) {
    /*
    debugPrint("MainController openFile(PlatformFile name ${file.name})");
    debugPrint("MainController openFile(PlatformFile bytes ${file.bytes})");
    debugPrint("MainController openFile(PlatformFile size ${file.size})");
    debugPrint("MainController openFile(PlatformFile extension ${file.extension})");
    debugPrint("MainController openFile(PlatformFile path ${file.path})");
    OpenFile.open(file.path);
    Get.to(
      MaterialPageRoute(
        builder: ((context) {
          return FilesPage(

          );
        } ),
      )
    );
    */
  }

  @override
  void onClose() {
    super.onClose();
  }
}