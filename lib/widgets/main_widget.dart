import 'package:dart_sqflite/controllers/main_controller.dart';
import 'package:dart_sqflite/widgets/base_widgets.dart';
import 'package:dart_sqflite/widgets/swipe_refresh_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Obx ( () {
        if (controller.isLoading()) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SwipeRefreshListWidget();
        }
    }, );
  }
}