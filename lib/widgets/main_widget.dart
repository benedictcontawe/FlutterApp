import 'package:dart_hive/controllers/main_controller.dart';
import 'package:dart_hive/widgets/base_widgets.dart';
import 'package:dart_hive/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Align(
      alignment: Alignment.center,
      child: Column (
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonWidget(
            onPressed: () {
              controller.launchPrimitive();
            },
            text: 'Primitive',
          ),
          ButtonWidget(
            onPressed: () {
              controller.launchObject();
            },
            text: 'Object',
          ),
        ],
      ),
    );
  }
}