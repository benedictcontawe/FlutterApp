import 'package:getx_storage/controllers/main_controller.dart';
import 'package:getx_storage/views/base_view.dart';
import 'package:getx_storage/widgets/app_bar_widget.dart';
import 'package:getx_storage/widgets/primitive_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends BaseView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("MainPage build");
    debugPrint("MainPage initialized ${controller.initialized}");
    debugPrint("MainPage isClosed ${controller.isClosed}");
    return const Scaffold ( 
      appBar: AppBarWidget(),
      body: PrimitiveWidget(),
    );
  }
}