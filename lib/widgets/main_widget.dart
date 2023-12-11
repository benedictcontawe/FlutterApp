import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_drawer/controllers/main_controller.dart';
import 'package:navigation_drawer/widgets/base_widgets.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { 
    super.key,
  } );

  @override
  Widget build(BuildContext context) {
    return Obx(() => Center (
      child: Text(controller.getTitle().value),
    ) );
  }
}