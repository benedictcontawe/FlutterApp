import 'package:dart_http/controllers/base_controller.dart';
import 'package:dart_http/models/nasa_holder_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends BaseController {

  DetailController() {
    debugPrint("DetailController Constructor");
  }

  final RxBool _isLoading = true.obs;
  final Rx<NasaHolderModel?> _model = NasaHolderModel().obs;

  @override
  void onInit() {
    debugPrint("DetailController onInit");
    fetch();
    debugPrint("DetailController model ${_model.value}");
    super.onInit();
  }

  void fetch() { debugPrint("DetailController fetch");
    _isLoading(true);
    _model(Get.arguments);
    _isLoading(false);
  }

  String getImage() {
    return _model.value?.image ?? "Nil";
  }

  String getTitle() {
    return _model.value?.title ?? "Nil";
  }

   String getExplanation() {
    return _model.value?.explanation ?? "Nil";
  }

  String getDate() {
    return _model.value?.date ?? "Nil";
  }

  String getCopyright() {
    return _model.value?.copyright ?? "Nil";
  }


  bool isLoading() {
    return _isLoading.value;
  }

  @override
  void onClose() {
    debugPrint("DetailController onClose");
    super.onClose();
  }
}