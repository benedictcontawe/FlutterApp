import 'package:dart_sqflite/controllers/main_controller.dart';
import 'package:dart_sqflite/widgets/base_widgets.dart';
import 'package:dart_sqflite/widgets/list_widget.dart';
import 'package:flutter/material.dart';

class SwipeRefreshListWidget extends BaseWidget<MainController> {

  const SwipeRefreshListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator (
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () {
        return controller.updateModels();
      },
      child: const ListWidget(),
    );
  }
}