import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/object_controller.dart';
import 'package:getx_storage/widgets/base_widgets.dart';
import 'package:getx_storage/widgets/swipe_refresh_list_widget.dart';

class ObjectWidget extends BaseWidget<ObjectController> {
  
  const ObjectWidget( { 
    super.key 
  } );

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