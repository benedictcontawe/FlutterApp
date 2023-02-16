import 'package:dart_http/controllers/main_controller.dart';
import 'package:dart_http/widgets/base_widgets.dart';
import 'package:dart_http/widgets/list_widget.dart';
import 'package:flutter/material.dart';

class SwipeRefreshListWidget extends BaseWidget<MainController> {

  const SwipeRefreshListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator (
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () {
        return controller.fetchAPOD(5);
      },
      child: const ListWidget(),
    );
  }
}