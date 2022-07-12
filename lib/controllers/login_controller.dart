import 'package:get_x/controllers/BaseController.dart';
import 'package:get_x/repository/user_repository.dart';
import 'package:get_x/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {

  final UserRepository userRepo;
  LoginController(this.userRepo);
  
  @override
  void onInit() {
    super.onInit();
    logDebug("LogInController onInit");
  }

  @override
  void onReady() {
    super.onReady();
    logDebug("LogInController onReady");
  }

  void launchPinCode() {
    logDebug("LogInController launchPinCode");
    Get.toNamed(Routes.PINCODE);
  }

  @override
  void onClose() {
    logDebug("LogInController onClose");
    super.onClose();
  }
}