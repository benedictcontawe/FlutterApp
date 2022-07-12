import 'package:get/get.dart';
import 'package:get_x/bindings/CustomBinding.dart';
import 'package:get_x/bindings/splash_binding.dart';
import 'package:get_x/views/custom_page.dart';
import 'package:get_x/views/splash_page.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.CUSTOM, 
      page: () => const CustomPage(), 
      binding: CustomBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 3000),
      ),
  ];
}