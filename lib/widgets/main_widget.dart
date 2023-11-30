import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_view/controllers/main_controller.dart';
import 'package:list_view/widgets/base_widget.dart';
import 'package:list_view/widgets/swipe_refresh_list_widget.dart';

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