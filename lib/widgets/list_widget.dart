import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_view/controllers/main_controller.dart';
import 'package:list_view/models/custom_model.dart';
import 'package:list_view/widgets/base_widget.dart';
import 'package:list_view/widgets/cell_default_widget.dart';
import 'package:list_view/widgets/cell_icon_widget.dart';
import 'package:list_view/widgets/cell_name_widget.dart';

class ListWidget extends BaseWidget<MainController> {
  
  const ListWidget ( {
    super.key
  } );

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      return ListView.builder (
        itemCount: controller.getLength(),
        itemBuilder: (BuildContext context, int index) {
          switch (controller.getViewType(index)) {
            case CustomModel.defaultViewType:
            return new CellDefaultWidget(
              name: controller.getName(index), icon: controller.getIcon(index),
              onTap: () {
                debugPrint('Card tapped ${controller.getName(index)} CellDefaultWidget.');
              },
            );
            case CustomModel.iconViewType:
            return new CellIconWidget (
              name: controller.getName(index), icon: controller.getIcon(index), 
              onTap: () {
                debugPrint('Card tapped ${controller.getName(index)} CellIconWidget.');
              },
            );
            case CustomModel.nameViewType:
            return new CellNameWidget (
              name: controller.getName(index),
              onTap: () {
                debugPrint('Card tapped ${controller.getName(index)} CellNameWidget.');
              },
            );
            default:
            return new CellDefaultWidget (
              name: controller.getName(index), icon: controller.getIcon(index),
              onTap: () {
                debugPrint('Card tapped ${controller.getName(index)} CellDefaultWidget.');
              },
            );
          }         
        }
      );   
    }, );
  }
}