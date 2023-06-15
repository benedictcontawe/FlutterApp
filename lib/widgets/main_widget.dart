import 'package:flutter/material.dart';
import 'package:getx_storage/controllers/main_controller.dart';
import 'package:getx_storage/widgets/base_widgets.dart';
import 'package:getx_storage/widgets/button_widget.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { 
    super.key
  } );

  @override
  Widget build(BuildContext context) {
    return Center (
      child: Row (
        children: [
          ButtonWidget (
            text: "Primitive", 
            onPressed: () {
                controller.onLaunchPrimitive();
            },
          ),
          ButtonWidget (
            text: "Object", 
            onPressed: () {
                controller.onLaunchObject();
            },
          ),
        ]
      ),
    );
  }
}