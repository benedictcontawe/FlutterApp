import 'package:getx_storage/bindings/object_binding.dart';
import 'package:getx_storage/bindings/primitive_bindings.dart';
import 'package:getx_storage/bindings/splash_binding.dart';
import 'package:getx_storage/bindings/main_binding.dart';
import 'package:getx_storage/views/main_page.dart';
import 'package:getx_storage/views/object_page.dart';
import 'package:getx_storage/views/primitive_page.dart';
import 'package:getx_storage/views/splash_page.dart';
import 'package:get/get.dart';
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
    GetPage (
      name: Routes.PRIMITIVE,
      page: () => const PrimitivePage(),
      binding: PrimitivaBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage (
      name: Routes.OBJECT,
      page: () => const ObjectPage(),
      binding: ObjectBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    )
  ];
}