import 'package:dart_hive/bindings/splash_binding.dart';
import 'package:dart_hive/bindings/main_binding.dart';
import 'package:dart_hive/views/main_page.dart';
import 'package:dart_hive/views/splash_page.dart';
import 'package:get/get.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 3000),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}