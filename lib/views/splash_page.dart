import 'package:flutter/material.dart';
import 'package:list_view/controllers/splash_controller.dart';
import 'package:list_view/views/base_view.dart';
import 'package:list_view/widgets/splash_widget.dart';

class SplashPage extends BaseView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("SplashPage build");
    debugPrint("SplashPage initialized ${controller.initialized}");
    debugPrint("SplashPage isClosed ${controller.isClosed}");
    return const Scaffold( 
        body : SplashWidget(),
    );
  }
}