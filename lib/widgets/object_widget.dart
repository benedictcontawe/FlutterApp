import 'package:dart_hive/controllers/object_controller.dart';
import 'package:dart_hive/widgets/base_widgets.dart';
import 'package:dart_hive/widgets/swipe_refresh_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObjectWidget extends BaseWidget<ObjectController> {
  
  const ObjectWidget( { super.key } );

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