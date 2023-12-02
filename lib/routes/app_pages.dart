import 'package:get/get.dart';
import 'package:navigation_drawer/binders/main_binding.dart';
import 'package:navigation_drawer/binders/splash_binding.dart';
import 'package:navigation_drawer/views/main_page.dart';
import 'package:navigation_drawer/views/splash_page.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage (
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 3000),
    ),
    GetPage (
      name: Routes.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}