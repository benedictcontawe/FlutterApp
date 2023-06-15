import 'package:getx_storage/views/base_view.dart';
import 'package:getx_storage/widgets/app_bar_widget.dart';
import 'package:getx_storage/widgets/main_widget.dart';
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