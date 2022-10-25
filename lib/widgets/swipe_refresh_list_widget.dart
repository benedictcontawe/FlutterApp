import 'package:dart_hive/controllers/object_controller.dart';
import 'package:dart_hive/widgets/base_widgets.dart';
import 'package:dart_hive/widgets/list_widget.dart';
import 'package:flutter/material.dart';

class SwipeRefreshListWidget extends BaseWidget<ObjectController> {

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