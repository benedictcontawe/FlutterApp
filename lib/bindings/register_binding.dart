import 'package:get/get.dart';
import 'package:getx_storage/bindings/base_binding.dart';
import 'package:getx_storage/controllers/register_controller.dart';
import 'package:getx_storage/firebase/firebase_auth_service.dart';

class RegisterBinding extends BaseBinding {
  
  @override
  void dependencies() {
    Get.lazyPut<RegisterController> ( 
      () => RegisterController(
        Get.find<FirebaseAuthService>(),
      )
    );
  }

}