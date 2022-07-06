import 'package:get/get.dart';
import '../../../repository/user_repository.dart';
import '../controller/login.controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(UserRepository()),
    );
  }
}
