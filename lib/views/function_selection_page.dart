import 'package:get_x/views/base_view.dart';
import 'package:get_x/controllers/functionselectioncontroller.dart';
import 'package:get_x/widgets/bottom_navigation_widget.dart';
import 'package:get_x/widgets/function_selection_widget.dart';
import 'package:flutter/material.dart';


class FunctionSelectionPage extends BaseView<FunctionSelectionController> {
  
  const FunctionSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.logDebug("FunctionSelectionPage build");
    controller.initialized;
    controller.isClosed;
    return const Scaffold(
      body: FunctionSelectionWidget(),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}