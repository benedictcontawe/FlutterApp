import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:navigation_drawer/controllers/base_controller.dart';
import 'package:navigation_drawer/models/drawer_model.dart';

class MainController extends BaseController {

  MainController() {

  }

  final RxList<DrawerModel?> _list = new List<DrawerModel>.empty().obs;


  @override
  void onInit() {
    super.onInit();
    debugPrint("MainController onInit");
    fetchDrawerModels();
  }

  Future<void> fetchDrawerModels() async {
    try {
      _list.value = <DrawerModel>[];
      _list.clear();
      _list.add(new DrawerModel(text: "A",isHeader: true, isExpand: true.obs));
      _list.add(new DrawerModel(text: "B",isHeader: false, isExpand: true.obs));
      _list.add(new DrawerModel(text: "C",isHeader: false, isExpand: true.obs));
      _list.add(new DrawerModel(text: "D",isHeader: true, isExpand: true.obs));
      _list.add(new DrawerModel(text: "E",isHeader: false, isExpand: true.obs));
      _list.add(new DrawerModel(text: "F",isHeader: false, isExpand: true.obs));
      _list.add(new DrawerModel(text: "G",isHeader: false, isExpand: true.obs));
      _list.add(new DrawerModel(text: "H",isHeader: false, isExpand: true.obs));
      _list.add(new DrawerModel(text: "I",isHeader: true, isExpand: true.obs));
      _list.add(new DrawerModel(text: "J",isHeader: false, isExpand: true.obs));
      _list.add(new DrawerModel(text: "K",isHeader: true, isExpand: true.obs));
      _list.add(new DrawerModel(text: "L",isHeader: false, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "M",isHeader: false, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "N",isHeader: false, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "O",isHeader: true, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "P",isHeader: false, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "Q",isHeader: false, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "R",isHeader: false, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "S",isHeader: false, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "T",isHeader: false, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "U",isHeader: true, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "V",isHeader: false, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "W",isHeader: true, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "X",isHeader: false, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "Y",isHeader: true, isExpand: true.obs));     
      _list.add(new DrawerModel(text: "Z",isHeader: false, isExpand: true.obs));     
      debugPrint("ObjectController _list ${_list.value.length} ${_list.value}");
    } catch (exception) {
      debugPrint("ObjectController update models exception $exception");
      onShowAlert("Error!", exception.toString());
    } finally {

    }
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint("MainController onReady");
  }

   int getLength() {
    return _list.value.length ?? 0;
  }

  String getText(int index) {
    return _list.value[index]?.text ?? "Nil";
  }

  bool isHeader(final int index) {
    return _list.value[index]?.isHeader ?? false;
  }

  RxBool isExpand(final int index) {
    return _list.value[index]?.isExpand ?? true.obs;
  }

  Future<void> setExpand(final int position) async {
    debugPrint("MainController setExpand $position");
    _list.value[position]?.isExpand!(true);
    for (int index = position; index < getLength(); index++) {
        if (_list.value[index]!.isHeader! && index != position) {
            break;
        } else if (!_list.value[index]!.isHeader!) {
          _list.value[index]?.isExpand!(true);
        }
    }
  }

  Future<void> setCompress(final int position) async {
    debugPrint("MainController setCompress $position");
    _list.value[position]?.isExpand!(false);
    for (int index = position; index < getLength(); index++) {
        if (_list.value[index]?.isHeader == true && index != position) {
            break;
        } else if (!_list.value[index]!.isHeader!) {
          _list.value[index]?.isExpand!(false);
        }
    }
  }

  Future<void> onTap(final String title, final int position) async {
    onShowAlert(title, " ${_list.value[position]?.text}");
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint("MainController onClose");
  }
}