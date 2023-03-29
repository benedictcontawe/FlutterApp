import 'package:dart_http/views/base_view.dart';
import 'package:dart_http/widgets/app_bar_widget.dart';
import 'package:dart_http/widgets/main_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends BaseView {

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("MainPage build");
    return Scaffold ( 
      appBar: AppBarWidget (
        height: MediaQuery.of(context).size.height * 0.10, 
        title: "Flutter App",
      ),
      body: const MainWidget(),
    );
  }
}