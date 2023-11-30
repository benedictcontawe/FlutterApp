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

  Future<void> onPickFile() async {
    const type = FileType.custom; //FileType.media
    final extensions = ['pdf', 'mp4', 'jpg', 'png'];
    final result = await _pickFile(type, extensions);
    if (result != null) {
      openFile(result.files.first);
    } else {
      onShowAlert("Error","Result File is null!");
    }
  }

  Future<void> onPickFiles() async {
    const type = FileType.custom; //FileType.media
    final extensions = ['pdf', 'mp4', 'jpg', 'png'];
    final result = await _pickFiles(type, extensions);
    if (result != null) {
      openFiles(result.files);
    } else {
      onShowAlert("Error","Result Files is null!");
    }
  }

   Future<FilePickerResult?> _pickFile(FileType type, List<String>? extensions) async {
    return await FilePicker.platform.pickFiles(allowMultiple: false, type: type, allowedExtensions: extensions);
  }

  Future<FilePickerResult?> _pickFiles(FileType type, List<String>? extensions) async {
    return await FilePicker.platform.pickFiles(allowMultiple: true, type: type, allowedExtensions: extensions);
  }

  void openFile(PlatformFile file) {
    debugPrint("MainController openFile(PlatformFile name ${file.name})");
    debugPrint("MainController openFile(PlatformFile size ${file.size})");
    debugPrint("MainController openFile(PlatformFile extension ${file.extension})");
    if (file?.bytes != null) {
      debugPrint("MainController openFile(PlatformFile bytes ${file.bytes})");
      onShowAlert("Error","Open File for ${file.name} Not supported!");
    }  else if (file?.path != null) {
      debugPrint("MainController openFile(PlatformFile path ${file.path})");
      OpenFile.open(file.path);
    }
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