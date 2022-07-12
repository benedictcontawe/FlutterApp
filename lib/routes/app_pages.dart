import 'package:get/get.dart';
import 'package:get_x/bindings/CustomBinding.dart';
import 'package:get_x/bindings/function_selection_binding.dart';
import 'package:get_x/bindings/login_binding.dart';
import 'package:get_x/bindings/pin_code_binding.dart';
import 'package:get_x/bindings/splash_binding.dart';
import 'package:get_x/views/balance_check_page.dart';
import 'package:get_x/views/loadingPage.dart';
import 'package:get_x/views/custom_page.dart';
import 'package:get_x/bindings/forgot_password.binding.dart';
import 'package:get_x/views/forgot_password.page.dart';
import 'package:get_x/views/function_selection_page.dart';
import 'package:get_x/views/login_page.dart';
import 'package:get_x/views/pin_code_page.dart';
import 'package:get_x/views/retail_sale_page.dart';
import 'package:get_x/views/splash_page.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.CUSTOM, 
      page: () => const CustomPage(), 
      binding: CustomBinding(),
      ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 3000),
    ),
    
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordPage(),
      binding: ForgotPaswordBinding(),
    ),
    GetPage(
      name: Routes.PINCODE,
      page: () => PinCodePage(),
      binding: PinCodeBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
     GetPage(
      name: Routes.FUNCTIONSELECTION,
      page: () => const FunctionSelectionPage(),
      binding: FunctionSelectionBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.LOADING,
      page: () => const LoadingPage(), //LoadingPage()
      //binding: LoadingBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.BALANCECHECK,
      page: () => const BalanceCheckPage(), //BalanceCheckPage()
      //binding: BalanceCheckBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.RETAILSALE,
      page: () => const RetailSalePage(),// RETAILSALEPage()
      //binding: RETAILSALEBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}