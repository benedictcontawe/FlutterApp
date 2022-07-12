

import 'package:get/get.dart';
import 'package:get_x/bindings/base_binding.dart';
import 'package:get_x/controllers/forgot_password.controller.dart';
import 'package:get_x/repository/user_repository.dart';

class ForgotPaswordBinding extends BaseBinding {

  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<ForgorPasswordController>(
      () => ForgorPasswordController(UserRepository()),
    );
  }
  
}