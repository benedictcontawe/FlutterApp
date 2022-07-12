import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_x/models/CustomDataModel.dart';
import 'BaseController.dart';

class CustomController extends BaseController {
  
  final _customDataModel = const CustomDataModel(id: 1, name: "John").obs;
  final _dataModel = const CustomDataModel(id: 2, name: "John").obs;
  var _sum = 0;

  @override
  void onInit() { // called immediately after the widget is allocated memory
    //fetchApi();
    super.onInit();
  }

  //void increment() => counter.value++;
  void increament() {
    //counter.value++;
  }

  @override
  void onReady() { // called after the widget is rendered on screen
    //showIntroDialog();
    super.onReady();
  }

  void convertToUppderCase() {
    
  }

  void setLog(String log) {
    logDebug("CustomController setLog $log");
  }

  String getLog() {
    return "getLog()";
  }

  void setSum(int first, int second) {
    _sum = first + second;
  }

  RxInt getSum() {
    return _sum.obs;
  }

  @override
  void onClose() { // called just before the Controller is deleted from memory
    //closeStream();
    super.onClose();
  }
}