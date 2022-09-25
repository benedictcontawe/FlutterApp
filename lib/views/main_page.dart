import 'package:dart_http/controllers/main_controller.dart';
import 'package:dart_http/views/base_view.dart';
import 'package:dart_http/widgets/main_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends BaseView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("MainPage build");
    debugPrint("MainPage initialized ${controller.initialized}");
    debugPrint("MainPage isClosed ${controller.isClosed}");
    return Scaffold( 
      appBar: AppBar (
        elevation: 0,
        title: const Text(
          "Flutter App",
          style: TextStyle(
            fontFamily: "avenir",
            fontSize: 32,
            fontWeight: FontWeight.w900
          ),
        ),
      ),
      body: const MainWidget(),
    );
  }
}