import 'package:get_x/bindings/base_binding.dart';
import 'package:get/get.dart';
import 'package:get_x/controllers/splash_controller.dart';

class SplashBinding extends BaseBinding {

  @override
  void dependencies() {
    super.dependencies();
    logDebug("SplashBinding dependencies");
    Get.lazyPut<SplashController>( () => SplashController(), fenix : true );
  }
}