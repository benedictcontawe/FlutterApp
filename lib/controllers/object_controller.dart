import 'dart:async';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/firebase/firebase_storage_service.dart';
import 'package:getx_storage/firebase/firestore_service.dart';
import 'package:getx_storage/models/custom_model.dart';
import 'package:getx_storage/util/get_storage_manager_.dart';

class ObjectController extends BaseController {
  
  ObjectController(GetStorageManager this._getStorageManager, FirestoreService this._service, FirebaseStorageService this._storage) {
    debugPrint("DashboardController Constructor");
  }

  final GetStorageManager _getStorageManager;
  //#region Firabase Instances
  final FirestoreService _service;
  final FirebaseStorageService _storage;
  //#endregion
  final RxBool _isLoading = true.obs;
  final RxList<CustomModel> _list = new List<CustomModel>.empty().obs;
  TextEditingController? _controller;
  PlatformFile? file = null;
  final RxString liveFileName = "".obs, liveFileSize = "".obs, liveFileExtension = "".obs;
  Rx<Uint8List> liveFileBytes = Uint8List.fromList([0]).obs;

  @override
  void onInit() {
    super.onInit();
    fetchModels();
  }

  int _generateId(int min, int max) {
    int newId = min + Random().nextInt(max - min);
    while(_list.where((oldModel) => oldModel.id == newId ).isEmpty == false) {
      newId = min + Random().nextInt(max - min);
    }
    return newId;
  }

  @override
  void onReady() {
    super.onReady();
  }

  bool isLoading() {
    return _isLoading.value;
  }

  RxBool observeLoading() {
    return _isLoading;
  }

  int getLength() {
    return _list.value.length ?? 0;
  }
  /*
  String getIcon(int index) {
    return _list.value[index].icon ?? "Nil";
  }
  */
  String getName(int index) {
    return _list.value[index]?.name ?? "Nil";
  }

  Future<void> fetchModels() async {
    try {
      _isLoading(true);
      _list.value = <CustomModel>[];
      _list.value = await _getStorageManager.getModels() ?? <CustomModel>[];
      //TODO: Fetch from Firebase then save to get storage then display
      debugPrint("ObjectController _list ${_list.value.length} ${_list.value}");
    } catch (exception) {
      debugPrint("ObjectController update models exception $exception");
      onShowAlert("Error!", exception.toString());
    } finally {
      _isLoading(false);
    }
  }

  Future<void> resetController() async {
    _controller = null;
    _controller = new TextEditingController();
  }

  Future<void> setController(int index) async {
    _controller = null;
    _controller = new TextEditingController();
    _controller?.text = _list.value[index]?.name ?? "";
  }

  TextEditingController getController() {
    return _controller ?? TextEditingController();
  }

  Future<void> addModel() async {
    try {
      _isLoading(true);
      final model = CustomModel (
        id: _generateId(0, _list.length + 1),
        name: _controller?.text.toString(),
        icon:  null,//TODO Use Picture for displaying const Icon(Icons.android)
      );
      //TODO: Store Image, and Data to Firebase Database and Storage
      _getStorageManager.addModel(model);
    } catch (exception) {
      debugPrint("ObjectController add model exception $exception");
      onShowAlert("Error!", exception.toString());
    } finally {
      Get.back();
      fetchModels();
      liveFileName("");
      liveFileSize("");
      liveFileExtension("");
      liveFileBytes(Uint8List.fromList([0]));
      _isLoading(false);
    }
  }
  //#region For Picking and displaying Image Files Methods
  Future<void> onPickFiles() async {
    const type = FileType.custom;
    final extensions = ['jpg', 'png', 'webp'];
    final result = await pickFiles(type, extensions);
    openFile(result?.files?.single);
  }

  Future<FilePickerResult?> pickFiles(FileType type, List<String>? extensions) async {
    return await FilePicker.platform.pickFiles(type: type, allowedExtensions: extensions);
  }

  Future<void> openFile(PlatformFile? file) async {
    debugPrint("MainController openFile(PlatformFile name ${file?.name})");
    debugPrint("MainController openFile(PlatformFile size ${file?.size})");
    debugPrint("MainController openFile(PlatformFile extension ${file?.extension})");
    debugPrint("MainController openFile(PlatformFile bytes ${file?.bytes})");
    _isLoading(true);
    this.file = file;
    final kb = file!.size / 1024;
    final mb = kb / 1024;
    final fileSize = mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    liveFileName(file?.name?.split('.').first);
    liveFileSize(fileSize);
    liveFileExtension(file?.extension);
    if (file?.extension?.toLowerCase()?.contains("jpg") == true || file?.extension?.toLowerCase()?.contains("png") == true || file?.extension?.toLowerCase()?.contains("webp") == true) {
      liveFileBytes(file?.bytes);
    }
    _isLoading(false);
  }
  //#endregion
  Future<void> updateName(int index) async {
    //TODO: will need also to edit image
    _list.value[index]?.name = _controller?.text.toString();
    //_getStorageManager.updateModel( _list?.value[index]) ;
    _getStorageManager.updateModels( _list?.value) ;
    Get.back();
    fetchModels();
  }

  Future<void> deleteModel(int index) async {
    //_list?.removeAt(index);
    _getStorageManager.deleteModel( _list?.value[index] );
    fetchModels();
  }

  Future<void> deleteAll() async {
    try {
      _list.value = <CustomModel>[];
      _getStorageManager.removeModels();
    } catch (exception) {
      debugPrint("ObjectController Delete All exception $exception");
      onShowAlert("Error!", exception.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}