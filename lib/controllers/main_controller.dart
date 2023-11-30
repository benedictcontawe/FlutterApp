import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_view/controllers/base_controller.dart';
import 'package:list_view/models/custom_model.dart';

class MainController extends BaseController {

  MainController() {
    debugPrint("MainController Constructor");
  }

  final RxBool _isLoading = true.obs;
  final RxList<CustomModel> _list = new List<CustomModel>.empty().obs;


  @override
  void onInit() {
    super.onInit();
    fetchModels();
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

  String getName(int index) {
    return _list.value[index]?.name ?? "Nil";
  }

  IconData getIcon(int index) {
    return _list.value[index]?.icon ?? Icons.broken_image_rounded;
  }

  int getViewType(int index) {
    return _list.value[index]?.viewType ?? CustomModel.defaultViewType;
  }

  Future<void> fetchModels() async {
    try {
      _isLoading(true);
      _list.value = <CustomModel>[];
      _list.clear();
      _list.add(new CustomModel(id: null, name: "A", icon: Icons.android, viewType: CustomModel.defaultViewType));
      _list.add(new CustomModel(id: null, name: "B", icon: Icons.apple, viewType: CustomModel.nameViewType));
      _list.add(new CustomModel(id: null, name: "C", icon: Icons.android, viewType: CustomModel.nameViewType));
      _list.add(new CustomModel(id: null, name: "D", icon: Icons.android, viewType: CustomModel.iconViewType));
      _list.add(new CustomModel(id: null, name: "E", icon: Icons.apple, viewType: CustomModel.iconViewType));
      _list.add(new CustomModel(id: null, name: "F", icon: Icons.android, viewType: CustomModel.defaultViewType));
      _list.add(new CustomModel(id: null, name: "G", icon: Icons.android, viewType: CustomModel.iconViewType));
      _list.add(new CustomModel(id: null, name: "H", icon: Icons.android, viewType: CustomModel.iconViewType));
      _list.add(new CustomModel(id: null, name: "I", icon: Icons.android, viewType: CustomModel.nameViewType));
      _list.add(new CustomModel(id: null, name: "J", icon: Icons.apple, viewType: CustomModel.nameViewType));
      _list.add(new CustomModel(id: null, name: "K", icon: Icons.android, viewType: CustomModel.defaultViewType));
      _list.add(new CustomModel(id: null, name: "L", icon: Icons.android, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "M", icon: Icons.android, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "N", icon: Icons.apple, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "O", icon: Icons.android, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "P", icon: Icons.android, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "Q", icon: Icons.android, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "R", icon: Icons.android, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "S", icon: Icons.android, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "T", icon: Icons.android, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "U", icon: Icons.apple, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "V", icon: Icons.android, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "W", icon: Icons.android, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "X", icon: Icons.apple, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "Y", icon: Icons.android, viewType: CustomModel.nameViewType));     
      _list.add(new CustomModel(id: null, name: "Z", icon: Icons.apple, viewType: CustomModel.nameViewType));     
      debugPrint("ObjectController _list ${_list.value.length} ${_list.value}");
    } catch (exception) {
      debugPrint("ObjectController update models exception $exception");
      onShowAlert("Error!", exception.toString());
    } finally {
      _isLoading(false);
    }
  }


  @override
  void onClose() {
    super.onClose();
  }
}