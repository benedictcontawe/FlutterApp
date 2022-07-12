import 'package:get/get.dart';
import 'package:get_x/bindings/base_binding.dart';
import 'package:get_x/controllers/custom_controller.dart';

class CustomBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<CustomController> (
      () => CustomController()
    );
  }
}