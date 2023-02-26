import 'package:dart_media_query/controllers/main_controller.dart';
import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:dart_media_query/widgets/desktop_body_widget.dart';
import 'package:dart_media_query/widgets/mobile_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Obx(() {
      return NotificationListener<SizeChangedLayoutNotification> (
        onNotification: (SizeChangedLayoutNotification notification) {
          return controller.setWidth(notification);
        },
        child: SizeChangedLayoutNotifier(
          child: Obx(() {
            if (controller.isDesktop()) {
              return DesktopBodyWidget();
            } else if (controller.isMobile()) {
              return MobileBodyWidget();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },)
        ),
      );
    });
  }
}