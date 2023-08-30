import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  PlatformFile? file;
  final RxString liveFileName = "".obs, liveFileSize = "".obs, liveFileExtension = "".obs;
  final Rx<Uint8List> liveFileBytes = Uint8List.fromList([0]).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("ObjectController onInit()");
    _list(await _getStorageManager.getModels() ?? <CustomModel>[]); //_list.value = await _getStorageManager.getModels() ?? <CustomModel>[];
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint("ObjectController onReady()");
    fetchModels();
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
  
  String getIcon(int index) {
    return _list.value[index].icon ?? "Nil";
  }

  String getName(int index) {
    return _list.value[index]?.name ?? "Nil";
  }

  Future<void> fetchModels() async {
    debugPrint("ObjectController fetchModels()");
    try {
      _isLoading(true);
      debugPrint("ObjectController _list ${_list.value.length} ${_list.value}");
      final snapshot = await _service.getObjects();
      for (final item in snapshot) {
        debugPrint("ObjectController snapshot ${item.id} ${item.name} ${item.icon}");
        final model = _list.firstWhereOrNull( (oldItem) => oldItem.id == item.id);
        if(model != null && model.isNotSameContent(item)) {
          _updateName(item);
          _updateIcon(item);
        } else if (model == null) {
          _addModel(item);
        }
      }
    } catch (exception) {
      debugPrint("ObjectController fetch models exception $exception");
      onShowAlert("Error!", exception.toString());
    } finally {
      _getStorageManager.replaceModels(_list.value);
      _isLoading(false);
    }
  }

  Future<void> resetController() async {
    _controller = null;
    _controller = new TextEditingController();
  }

  Future<void> resetFile() async {
    liveFileName("");
    liveFileSize("");
    liveFileExtension("");
    liveFileBytes(Uint8List.fromList([0]));
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
      TaskSnapshot? taskSnapshot = await _storage.uploadPlatformFiles(file);
      if (taskSnapshot != null && taskSnapshot!.state == TaskState.success) {
        final model = CustomModel (
          name: _controller?.text.toString(),
          icon: await taskSnapshot.ref.getDownloadURL(),
        );
        await _service.createObject(model.toMap());
      } else {
        onShowAlert("Error", "on Upload Media Content Failed");
      }
    } catch (exception) {
      debugPrint("ObjectController Invalid add for Custom Model $exception");
      onShowAlert("Error", "Invalid add for Custom Model $exception");
    } finally {
      Get.back();
      resetFile();
      _isLoading(false);
      fetchModels();
    }
  }

  Future<void> _addModel(CustomModel newModel) async {
    debugPrint("ObjectController _addModel($newModel)");
    try {
      _list.add(newModel);
    } catch (exception) {
      debugPrint("ObjectController Invalid add for Custom Model $exception");
      onShowAlert("Error", "Invalid add for Custom Model $exception");
    }
  }
  //#region For Picking and displaying Image Files Methods
  Future<void> onPickFiles() async {
    const type = FileType.custom;
    final extensions = ['jpg', 'png', 'webp'];
    final result = await pickFiles(type, extensions);
    openFile(result?.files?.single);
  }

  Future<FilePickerResult?> pickFiles(
      FileType type, List<String>? extensions) async {
    return await FilePicker.platform
        .pickFiles(type: type, allowedExtensions: extensions);
  }

  Future<void> openFile(PlatformFile? file) async {
    debugPrint("MainController openFile(PlatformFile name ${file?.name})");
    debugPrint("MainController openFile(PlatformFile size ${file?.size})");
    debugPrint(
        "MainController openFile(PlatformFile extension ${file?.extension})");
    debugPrint("MainController openFile(PlatformFile bytes ${file?.bytes})");
    _isLoading(true);
    this.file = file;
    final kb = file!.size / 1024;
    final mb = kb / 1024;
    final fileSize =
        mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    liveFileName(file?.name?.split('.').first);
    liveFileSize(fileSize);
    liveFileExtension(file?.extension);
    if (file?.extension?.toLowerCase()?.contains("jpg") == true ||
        file?.extension?.toLowerCase()?.contains("png") == true ||
        file?.extension?.toLowerCase()?.contains("webp") == true) {
      liveFileBytes(file?.bytes);
    }
    _isLoading(false);
  }
  //#endregion
  Future<void> updateModel(int index) async {
    debugPrint("ObjectController updateModel($index)");
    //TODO: Funtion for editing or changing image finish the code for CustomDialog.editDialog
    //TODO: Update first the Firebase then use fetchModels method
    try {
      _isLoading(true);
      TaskSnapshot? taskSnapshot = await _storage.uploadPlatformFiles(file);
      if (taskSnapshot != null && taskSnapshot!.state == TaskState.success) {
        final model = CustomModel (
          name: _controller?.text.toString(),
          icon: await taskSnapshot.ref.getDownloadURL(),
        );
        await _service.updateObject(model);
      } else {
        onShowAlert("Error", "on Upload Media Content Failed");
      }
    } catch (exception) {
      debugPrint("ObjectController Invalid update for Custom Model $exception");
      onShowAlert("Error", "Invalid update for Custom Model $exception");
    } finally {
      Get.back();
      resetFile();
      _isLoading(false);
      fetchModels();
    }    
  }

  Future<void> _updateName(CustomModel newModel) async {
    debugPrint("ObjectController _updateName($newModel)");
    try {
      _list.where (
        (filterModel) => filterModel.isSameName(newModel)
      ).map (
        (oldModel) => oldModel.name = newModel.name
      );
    } catch (exception) {
      debugPrint("ObjectController Invalid update name for Custom Model $exception");
      onShowAlert("Error", "Invalid update name for Custom Model $exception");
    }
  }

  Future<void> _updateIcon(CustomModel newModel) async {
    debugPrint("ObjectController _updateIcon($newModel)");
    try {
      _list.where (
        (filterModel) => filterModel.isSameIcon(newModel)
      ).map (
        (oldModel) => oldModel.icon = newModel.icon
      );
    } catch (exception) {
      debugPrint("ObjectController Invalid update icon for Custom Model $exception");
      onShowAlert("Error", "Invalid update name for Custom Model $exception");
    }
  }

  Future<void> deleteModel(int index) async {
    debugPrint("ObjectController deleteModel");
    //TODO: Sync with Firebase and Get Storage
    //_list?.removeAt(index);
    _getStorageManager.deleteModel(_list?.value[index]);
    fetchModels();
  }

  Future<void> deleteAll() async {
    debugPrint("ObjectController deleteAll");
    //TODO: Sync with Firebase and Get Storage
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