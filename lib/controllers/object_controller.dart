import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/base_controller.dart';
import 'package:getx_storage/models/custom_model.dart';
import 'package:getx_storage/util/get_storage_manager_.dart';

class ObjectController extends BaseController {
  
  ObjectController(GetStorageManager this._getStorageManager) {

  }

  final GetStorageManager _getStorageManager;
  final RxBool _isLoading = true.obs;
  final RxList<CustomModel> _list = new List<CustomModel>.empty().obs;
  TextEditingController? _controller;

  @override
  void onInit() {
    super.onInit();
    fetchModels();
  }

  int _random(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  void onShowAlert(String title, String message) {
    Timer (
      const Duration(milliseconds: 2000), ( () => Get.snackbar(title, message) )
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  bool isLoading() {
    return _isLoading.value;
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
        id: _random(0, _list.length),
        name: _controller?.text.toString(),
        icon:  null,//const Icon(Icons.android)
      );
      _getStorageManager.addModel(model);
    } catch (exception) {
      debugPrint("ObjectController add model exception $exception");
      onShowAlert("Error!", exception.toString());
    } finally {
      Get.back();
      fetchModels();
      _isLoading(false);
    }
  }

  Future<void> updateName(int index) async {
    _list.value[index]?.name = _controller?.text.toString();
    //_getStorageManager.updateModel( _list?.value[index]) ;
    _getStorageManager.updateModels( _list?.value) ;
    Get.back();
    fetchModels();
  }

  Future<void> deleteModel(int index) async {
    _getStorageManager.deleteModel( _list?.value[index] );
    fetchModels();
  }

  Future<void> deleteAll() async {
    _list.value = <CustomModel>[];
    _getStorageManager.removeModels();
  }

  @override
  void onClose() {
    super.onClose();
  }
}