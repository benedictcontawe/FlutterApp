import 'package:get/get.dart';
import 'package:getx_storage/bindings/base_binding.dart';
import 'package:getx_storage/controllers/login_controller.dart';
import 'package:getx_storage/firebase/firebase_auth_service.dart';

class LoginBinding extends BaseBinding {

  @override
  void dependencies() {
    Get.lazyPut<LoginController> ( 
      () => LoginController(
        Get.find<FirebaseAuthService>(),
      )
    );
  }
}