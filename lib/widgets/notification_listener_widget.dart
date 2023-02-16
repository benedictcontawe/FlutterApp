import 'package:dart_http/controllers/main_controller.dart';
import 'package:dart_http/widgets/base_widgets.dart';
import 'package:dart_http/widgets/swipe_refresh_list_widget.dart';
import 'package:flutter/material.dart';

class NotificationListenerWidget extends BaseWidget<MainController> {

  const NotificationListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification> (
      onNotification: (scrollNotification) {
        return controller.onCheckScroll(scrollNotification);
      },
      child: const SwipeRefreshListWidget(),
    );
  }
}