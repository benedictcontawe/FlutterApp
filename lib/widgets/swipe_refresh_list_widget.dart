import 'package:flutter/material.dart';
import 'package:list_view/controllers/main_controller.dart';
import 'package:list_view/widgets/base_widget.dart';
import 'package:list_view/widgets/list_widget.dart';

class SwipeRefreshListWidget extends BaseWidget<MainController> {

  const SwipeRefreshListWidget( {
    Key? key
  } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator (
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () {
        return controller.fetchModels();
      },
      child: const ListWidget(),
    );
  }
}