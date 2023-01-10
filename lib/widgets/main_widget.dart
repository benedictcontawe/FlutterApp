import 'package:tab_bar/controllers/main_controller.dart';
import 'package:tab_bar/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Container(
      color: Colors.white,
      child: const Center(child:Text("First Tab Selected")),
    );
  }
}