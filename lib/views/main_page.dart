import 'package:flutter/material.dart';
import 'package:page_view/views/base_view.dart';
import 'package:page_view/widgets/app_bar_widget.dart';
import 'package:page_view/widgets/main_widget.dart';

class MainPage extends BaseView {

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("MainPage build");
    return Scaffold (
      appBar: AppBarWidget(
        height: MediaQuery.of(context).size.height * 0.07,
      ),
      body: const MainWidget(),
      drawer: null,
      endDrawer: null,
    );
  }
}