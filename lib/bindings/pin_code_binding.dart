import 'package:get_x/bindings/base_binding.dart';
import 'package:get/get.dart';
import 'package:get_x/controllers/pin_code_controller.dart';

class PinCodeBinding extends BaseBinding {

  @override
  void dependencies() {
    super.dependencies();
    logDebug("PinCodeBinding dependencies");super.dependencies();
    Get.lazyPut<PinCodeController> ( () => PinCodeController());
  }
}