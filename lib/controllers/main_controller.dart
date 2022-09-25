
import 'package:dart_http/controllers/base_controller.dart';
import 'package:dart_http/environment.dart';
import 'package:dart_http/http/http_service.dart';
import 'package:dart_http/nasa_holder_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  RxBool _isLoading = true.obs;
  final RxList<NasaHolderModel> _list = <NasaHolderModel>[].obs;  

  @override
  void onInit() {
    fetchAPOD();
    super.onInit();
  }

  void fetchAPOD() async {
    try {
      _isLoading(true);
      var apod = await HttpService.getAstronomyPictureOfTheDay(Environment.apiKey, 10);
      if (apod != null) {
        _list?.value = apod;
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

  int getLenght() {
    return _list?.length ?? 0;
  }

  String getTitle(int index) {
    return _list?.value[index].title ?? "Nil";
  }

  @override
  void onClose() {
    super.onClose();
  }
}