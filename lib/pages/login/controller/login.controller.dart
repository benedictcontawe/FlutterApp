import 'package:get/get.dart';
import 'package:get_x/repository/user_repository.dart';

class LoginController extends GetxController {
  final UserRepository userRepo;
  LoginController(this.userRepo);
}
