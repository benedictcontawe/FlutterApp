import 'package:dart_camera/views/base_view.dart';
import 'package:dart_camera/widgets/splash_widget.dart';
import 'package:flutter/material.dart';

class SplashPage extends BaseView {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold (
        body : SplashWidget(),
    );
  }
}