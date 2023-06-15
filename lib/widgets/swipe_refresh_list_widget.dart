import 'package:flutter/material.dart';
import 'package:getx_storage/controllers/object_controller.dart';
import 'package:getx_storage/widgets/list_widget.dart';
import 'base_widgets.dart';

class SwipeRefreshListWidget extends BaseWidget<ObjectController> {

  const SwipeRefreshListWidget( {
    Key? key
  } ) : super(key: key);

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