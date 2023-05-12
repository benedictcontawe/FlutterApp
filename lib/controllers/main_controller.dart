import 'dart:io';

import 'package:dart_http/controllers/base_controller.dart';
import 'package:dart_http/views/files_page.dart';
import 'package:file_picker/file_picker.dart';
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
    const type = FileType.custom; //FileType.media
    final extensions = ['pdf', 'mp4', 'jpg', 'png'];
    final result = await pickFiles(allowMultiple, type, extensions);
    if (allowMultiple == false && result != null) {
      openFile(result.files.first);
    } else if (allowMultiple == true && result != null) {
      openFiles(result.files);
    }
  }

  Future<FilePickerResult?> pickFiles(bool allowMultiple, FileType type, List<String>? extensions) async {
    if (allowMultiple == false) {
      return await FilePicker.platform.pickFiles(allowMultiple: allowMultiple, type: type, allowedExtensions: extensions);
    } else {
      return await FilePicker.platform.pickFiles(allowMultiple: allowMultiple, type: type, allowedExtensions: extensions);
    }
  }

  void openFile(PlatformFile file) {
    debugPrint("MainController openFile(PlatformFile name ${file.name})");
    debugPrint("MainController openFile(PlatformFile size ${file.size})");
    debugPrint("MainController openFile(PlatformFile extension ${file.extension})");
    if (Platform.isAndroid || Platform.isIOS) {
      debugPrint("MainController openFile(PlatformFile path ${file.path})");
    }
    debugPrint("MainController openFile(PlatformFile bytes ${file.bytes})");
    OpenFile.open(file.path);
  }

  void openFiles(List<PlatformFile> files) {
    Get.to (
      FilesPage (
        files: files,
        onOpenedFile: openFile,
      )
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}