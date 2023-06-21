import 'package:dart_sqflite/controllers/base_controller.dart';
import 'package:dart_sqflite/models/custom_model.dart';
import 'package:dart_sqflite/util/constants.dart';
import 'package:dart_sqflite/util/sqflite_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController(SqfliteManager this._sqfliteManager) { debugPrint("MainController Constructor");
    _sqfliteManager.database;
  }

  final RxBool _isLoading = true.obs;
  final RxList<CustomModel> _list = new List<CustomModel>.empty().obs;
  TextEditingController? _controller;
  final SqfliteManager _sqfliteManager;

  @override
  void onInit() { debugPrint("MainController onInit");
    updateModels();
    super.onInit();
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
    return _list.value[index].name ?? "Nil";
  }

  Future<void> updateModels() async {
    try {
      _isLoading(true);
      _list.value = <CustomModel>[];
      _list.value = await _sqfliteManager.getModels(Constants.TABLE_NAME);
      debugPrint("MainController _list ${_list.value.length} ${_list.value}");
      debugPrint("MainController _list ${await _sqfliteManager.queryRowCount(Constants.TABLE_NAME)}");
    } catch (exception) {
      debugPrint("MainController update models exception $exception");
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
    _controller?.text = _list.value[index].name ?? "";
  }

  TextEditingController getController() {
    return _controller ?? TextEditingController();
  }

  Future<void> add() async {
    final _model = CustomModel (
      name: _controller?.text.toString(),
      //icon:  const Icon(Icons.android)
    );
    await _sqfliteManager.onInsert(Constants.TABLE_NAME, _model);
    Get.back();
    updateModels();
  }

  Future<void> updateName(int index) async {
    final _model = CustomModel (
      id: _list.value[index].id,
      name: _controller?.text.toString(),
      //icon:  const Icon(Icons.android)
    );
    _sqfliteManager.onUpdate( Constants.TABLE_NAME, _model ) ;
    Get.back();
    updateModels();
  }

  Future<void> delete(int index) async {
    _sqfliteManager.onDelete( Constants.TABLE_NAME, _list.value[index] );
    updateModels();
  }

  Future<void> deleteAll() async {
    _list.value = <CustomModel>[];
    _sqfliteManager.onDeleteAll( Constants.TABLE_NAME, );
  }

  @override
  void onClose() {
    _sqfliteManager.onClose();
    super.onClose();
  }
}