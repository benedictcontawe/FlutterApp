import 'package:dart_camera/controllers/main_controller.dart';
import 'package:dart_camera/utils/constants.dart';
import 'package:dart_camera/views/base_view.dart';
import 'package:dart_camera/widgets/main_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends BaseView<MainController> {
  
  const MainPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("MainPage build");
    debugPrint("MainPage initialized ${controller.initialized}");
    debugPrint("MainPage isClosed ${controller.isClosed}");
    return Scaffold (
      appBar: AppBar (
        elevation: 0,
        title: const Text(
          Constants.APP_NAME,
          style: TextStyle (
            fontFamily: "avenir",
            fontSize: 32,
            fontWeight: FontWeight.w900
          ),
        ),
      ),
      body: const Center (
        child: MainWidget(),
      ),
    );
  }
}