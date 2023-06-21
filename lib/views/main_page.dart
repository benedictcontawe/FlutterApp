import 'package:dart_hive/controllers/main_controller.dart';
import 'package:dart_hive/views/base_view.dart';
import 'package:dart_hive/widgets/app_bar_widget.dart';
import 'package:dart_hive/widgets/main_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends BaseView {
  
  const MainPage( {
    super.key
  } );  
 
  @override
  Widget build(BuildContext context) {
    debugPrint("MainPage build");
    return const Scaffold ( 
      appBar: AppBarWidget(),
      body: MainWidget(),
    );
  }
}