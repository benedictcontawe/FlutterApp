import 'package:dart_http/controllers/main_controller.dart';
import 'package:dart_http/widgets/base_widgets.dart';
import 'package:dart_http/widgets/notification_listener_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Obx( () {
        debugPrint("MainWidget build ${controller.observeLoading().value}");
        if (controller.observeLoading().value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const NotificationListenerWidget();
        }
      }, 
    );
  }
}