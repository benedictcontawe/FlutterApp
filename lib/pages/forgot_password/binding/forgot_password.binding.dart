import 'package:get/get.dart';
import 'package:get_x/pages/forgot_password/controller/forgot_password.controller.dart';

import '../../../repository/user_repository.dart';

class ForgotPaswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgorPasswordController>(
      () => ForgorPasswordController(UserRepository()),
    );
  }
}
