import 'package:get/get.dart';
import 'package:getx_storage/bindings/base_binding.dart';
import 'package:getx_storage/controllers/login_controller.dart';

class LoginBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<LoginController> ( 
      () => LoginController(

      )
    );
  }
}