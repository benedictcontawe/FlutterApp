import 'package:dart_file_picker/controllers/splash_controller.dart';
import 'package:dart_file_picker/views/base_view.dart';
import 'package:dart_file_picker/widgets/splash_widget.dart';
import 'package:flutter/material.dart';

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