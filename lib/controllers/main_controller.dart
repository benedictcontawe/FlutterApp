import 'package:dart_http/controllers/base_controller.dart';
import 'package:dart_http/models/custom_model.dart';
import 'package:dart_http/util/hive_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController(HiveManager this._hiveManager) { debugPrint("MainController Constructor");
    _hiveManager.onOpen();
  }

  final RxBool _isLoading = true.obs;
  final RxList<CustomModel> _list = <CustomModel>[].obs;
  TextEditingController? _controller;
  final HiveManager _hiveManager;

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
      _list.value = await _hiveManager.getModels();
      debugPrint("MainController _list ${_list.value.length} ${_list.value}");
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

  TextEditingController getController() {
    return _controller ?? TextEditingController();
  }

  Future<void> add(TextEditingController? controller) async {
    final model = CustomModel(
      name: controller?.text.toString(),
      //icon:  const Icon(Icons.android)
    );
    _hiveManager.add(model);
    Get.back();
    updateModels();
  }

  Future<void> updateName(TextEditingController? controller) async {
    //TODO: Edit Data to Hive
    //controller.text.toString();
    Get.back();
  }

  Future<void> delete(int index) async {
    //TODO: Delete Data to Hive
    _hiveManager.onDelete(_list.value[index]);
    debugPrint("MainController delete $index");
  }

  Future<void> deleteAll() async {
    //TODO: Update UI after Delete All in Hive Done
    _hiveManager.onClear();
    debugPrint("MainController deleteAll");
    updateModels();
  }

  @override
  void onClose() {
    _hiveManager.onClose();
    super.onClose();
  }
}