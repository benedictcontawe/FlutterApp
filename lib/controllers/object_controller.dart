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
import 'package:getx_storage/util/constants.dart';
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
    _resetList();
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

  String _getId(int index) {
    return _list.value[index].id ?? Constants.NIL;
  }
  
  String getIcon(int index) {
    return _list.value[index].icon ?? Constants.NIL;
  }

  String getName(int index) {
    return _list.value[index]?.name ?? Constants.NIL;
  }

  Future<void> fetchModels() async {
    debugPrint("ObjectController fetchModels()");
    try {
      _isLoading(true);
      debugPrint("ObjectController _list ${_list.value.length} ${_list.value}");
      final snapshot = await _service.getObjects();
      _list.forEach((oldModel) {
        if (snapshot.where((newModel) => oldModel.id == newModel.id).isEmpty) {
          debugPrint("ObjectController oldModel ${oldModel.id} isEmpty");
          _deleteModel(oldModel.id);
        }
      } );
      for (final newModel in snapshot) {
        debugPrint("ObjectController snapshot $newModel");
        final model = _list.firstWhereOrNull( (oldModel) => oldModel.id == newModel.id);
        if(model != null && model.isNotSameContent(newModel)) {
          _updateName(newModel);
          _updateIcon(newModel);
        } else if (model == null) {
          _addModel(newModel);
        }
      }
    } catch (exception) {
      debugPrint("ObjectController fetch models exception $exception");
      onShowAlert("Error!", exception.toString());
    } finally {
      _getStorageManager.replaceModels(_list.value);
      _resetList();
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
    file = null;
  }

  Future<void> _resetList() async {
    _list(<CustomModel>[]);
    _list(await _getStorageManager.getModels() ?? <CustomModel>[]); //_list.value = await _getStorageManager.getModels() ?? <CustomModel>[];
  }

  Future<void> setController(int index) async {
    _controller = null;
    _controller = new TextEditingController();
    _controller?.text = getName(index);
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
    //TODO: Funtion for editing or changing IMAGE, updating of Name is DONE!
    //TODO: Sync Image to Firebase and Get Storage
    try {
      _isLoading(true);
      if (file == null/*&& getIcon(index) != Constants.NIL*/) {
        final model = CustomModel (
          id: _getId(index),
          name: _controller?.text.toString(),
          icon: getIcon(index),
        );
        await _service.updateObject(model);
      } else if (file != null) {
        TaskSnapshot? taskSnapshot = await _storage.uploadPlatformFiles(file);
        if (taskSnapshot != null && taskSnapshot!.state == TaskState.success) {
          final model = CustomModel (
            id: _getId(index),
            name: _controller?.text.toString(),
            icon: await taskSnapshot.ref.getDownloadURL(),
          );
          await _service.updateObject(model);
        }
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
    debugPrint("ObjectController _updateName(${newModel.id} ${newModel.name})");
    try {
      _list.where (
        (filterModel) => filterModel.isNotSameName(newModel)
      ).forEach (
        (oldModel) {
          oldModel.name = newModel.name;
        }
      );
    } catch (exception) {
      debugPrint("ObjectController Invalid update name for Custom Model $exception");
      onShowAlert("Error", "Invalid update name for Custom Model $exception");
    }
  }

  Future<void> _updateIcon(CustomModel newModel) async {
    debugPrint("ObjectController _updateIcon(${newModel.id} ${newModel.icon})");
    try {
      _list.where (
        (filterModel) => filterModel.isNotSameIcon(newModel)
      ).forEach (
        (oldModel) => oldModel.icon = newModel.icon
      );
    } catch (exception) {
      debugPrint("ObjectController Invalid update icon for Custom Model $exception");
      onShowAlert("Error", "Invalid update name for Custom Model $exception");
    }
  }

  Future<void> deleteModel(int index) async {
    debugPrint("ObjectController deleteModel($index)");
    
    try {
      _isLoading(true);
      final model = CustomModel(
        id: _getId(index),
        name: getName(index),
        icon: getIcon(index)
      );
      await _service.deleteObject(model);
    } catch(exception) {
      onShowAlert("Error", "Error deleting model $exception");
    } finally {
      Get.back();
      resetFile();
      _isLoading(false);
      fetchModels();
    }
    
    await _service.deleteObject(_list.value[index]);
    await fetchModels();
  }

  Future<void> _deleteModel(String? id) async {
    debugPrint("ObjectController _deleteModel($id)");
    try {
      if(id != null) {
        _list.removeWhere((oldModel) => oldModel.id == id);
      }
    } catch (exception) {
      debugPrint("ObjectController Invalid remove id $exception");
      onShowAlert("Error", "Invalid remove id $exception");
    }
  }

  Future<void> deleteAll() async {
    debugPrint("ObjectController deleteAll");

    try {
      _isLoading(true);

      for (final model in _list) {
        await _service.deleteAllObject(model);
      }

      onShowAlert("Success", "All models deleted successfully!");
    } catch(exception) {
      onShowAlert("Error", "Error deleting all object!");
    } finally {
      resetFile();
      _isLoading(false);
      fetchModels();
    }
    
  }

  @override
  void onClose() {
    super.onClose();
  }
}
