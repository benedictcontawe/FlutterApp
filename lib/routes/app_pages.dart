import 'package:dart_camera/bindings/splash_binding.dart';
import 'package:dart_camera/bindings/main_binding.dart';
import 'package:dart_camera/views/camera_page.dart';
import 'package:dart_camera/views/main_page.dart';
import 'package:dart_camera/views/splash_page.dart';
import 'package:dart_camera/views/video_page.dart';
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
      name: Routes.CAMERA,
      page: () => const CameraPage(),
      binding: MainBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
     GetPage (
      name: Routes.VIDEO,
      page: () => const VideoPage(),
      binding: MainBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}