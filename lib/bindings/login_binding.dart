import 'package:get_x/bindings/base_binding.dart';
import 'package:get/get.dart';
import 'package:get_x/controllers/login_controller.dart';
import 'package:get_x/repository/user_repository.dart';

class LoginBinding extends BaseBinding {

  @override
  void dependencies() {
    super.dependencies();
    logDebug("LoginBinding dependencies");super.dependencies();
    Get.lazyPut<LoginController>( () => LoginController(UserRepository()), fenix : true );
  }
}