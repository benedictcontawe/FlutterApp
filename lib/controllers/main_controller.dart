import 'dart:convert';

import 'package:dart_http/constants.dart';
import 'package:dart_http/controllers/base_controller.dart';
import 'package:dart_http/dio/api_method.dart';
import 'package:dart_http/dio/dio_service.dart';
import 'package:dart_http/models/nasa_holder_model.dart';
import 'package:dart_http/util/convert_list.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  final RxBool _isLoading = true.obs;
  final RxList<NasaHolderModel> _list = <NasaHolderModel>[].obs;
  DioService dioService = new DioService();

  @override
  void onInit() {
    dioService.initialize(null, null, null);
    dioService.initInterceptors();
    fetchAPOD();
    super.onInit();
  }

  Future<void> fetchAPOD() async {
    try {
      _isLoading(true);
      var response = await dioService.request(url: Constants.API_GET, method: ApiMethod.GET, params: {
        'api_key': Constants.API_KEY,
        'count': 1,
      });      
      debugPrint("MainController statusCode ${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("MainController response ${response}");
        debugPrint("MainController data ${response.data}");
        debugPrint("MainController toResponseList ${ConvertList.toResponseList(response)}");
        //_list.value = ;
      }
      debugPrint("MainController list ${_list.value}");
    } on RangeError {
      debugPrint("MainController RangeError");
    } catch (exception) {
      debugPrint("MainController exception $exception");
    } finally {
      _isLoading(false);
    }
  }

  bool isLoading() {
    return _isLoading.value;
  }

  int getLength() {
    return _list?.length ?? 0;
  }

  String getImage(int index) {
    return _list?.value[index].image ?? "Nil";
  }

  String getTitle(int index) {
    return _list?.value[index].title ?? "Nil";
  }

   String getExplanation(int index) {
    return _list?.value[index].explanation ?? "Nil";
  }

  String getDate(int index) {
    return _list?.value[index].date ?? "Nil";
  }

  String getCopyright(int index) {
    return _list?.value[index].copyright ?? "Nil";
  }

  @override
  void onClose() {
    super.onClose();
  }
}