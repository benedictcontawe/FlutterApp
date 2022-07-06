import 'package:get/get.dart';
import 'package:get_x/pages/forgot_password/binding/forgot_password.binding.dart';
import 'package:get_x/pages/forgot_password/view/forgot_password.page.dart';
import 'package:get_x/pages/login/view/login.page.dart';
import '../../pages/login/binding/login.binding.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordPage(),
      binding: ForgotPaswordBinding(),
    ),
  ];
}
