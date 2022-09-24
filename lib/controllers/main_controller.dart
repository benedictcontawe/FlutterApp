
import 'package:dart_http/controllers/base_controller.dart';
import 'package:dart_http/environment.dart';
import 'package:dart_http/http/http_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  var isLoading = true.obs;
  var list = [].obs;
  

  @override
  void onInit() {
    fetchAPOD();
    super.onInit();
  }

  void fetchAPOD() async {
    try {
      isLoading(true);
      var apod = await HttpService.getAstronomyPictureOfTheDay(Environment.apiKey, 10);
      if (apod != null) {
        list.value = apod;
      }
      debugPrint("MainController list ${list}");
    } finally {
      isLoading(false);
    }
  }
}