import 'package:get_x/controllers/splash_controller.dart';
import 'package:get_x/views/base_view.dart';
import 'package:get_x/widgets/splash_widget.dart';
import 'package:flutter/material.dart';

class SplashPage extends BaseView<SplashController> {
  
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.initialized;
    controller.isClosed;
    return const Scaffold( body: SplashWidget(),);
  }
}