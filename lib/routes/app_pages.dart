import 'package:dart_http/bindings/detail_binding.dart';
import 'package:dart_http/bindings/splash_binding.dart';
import 'package:dart_http/bindings/main_binding.dart';
import 'package:dart_http/views/detail_page.dart';
import 'package:dart_http/views/main_page.dart';
import 'package:dart_http/views/splash_page.dart';
import 'package:get/get.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => new SplashPage(),
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
    GetPage(
      name: Routes.DETAIL,
      page: () => const DetailPage(),
      binding: DetailBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}