import 'package:tab_bar/controllers/main_controller.dart';
import 'package:tab_bar/views/base_view.dart';
import 'package:tab_bar/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:tab_bar/widgets/tab_bar_view_widget.dart';

class MainPage extends BaseView<MainController> {

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("MainPage build");
    debugPrint("MainPage initialized ${controller.initialized}");
    debugPrint("MainPage isClosed ${controller.isClosed}");
    return const Scaffold(
      appBar: AppbarWidget(),
      body: TabBarViewWidget(),
    );
  }
}