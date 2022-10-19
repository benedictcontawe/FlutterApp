import 'package:dart_http/controllers/base_controller.dart';
import 'package:dart_http/http/http_service.dart';
import 'package:dart_http/models/nasa_holder_model.dart';
import 'package:dart_http/util/convert_list.dart';
import 'package:dart_http/util/environment.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController() {
    debugPrint("MainController Constructor");
  }

  final RxBool _isLoading = true.obs;
  final RxList<NasaHolderModel> _list = new List<NasaHolderModel>.empty().obs;

  @override
  void onInit() {
    fetchAPOD();
    super.onInit();
  }

  Future<void> fetchAPOD() async {
    try {
      _isLoading(true);
      final apod = await HttpService.getAstronomyPictureOfTheDay(Environment.apiKey, getLength() + 5);
      if (apod != null) {
        _list.value = ConvertList.toHolderList(apod);
      }
      debugPrint("MainController list ${_list}");
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