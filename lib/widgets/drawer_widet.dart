import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_drawer/controllers/main_controller.dart';
import 'package:navigation_drawer/widgets/base_widgets.dart';
import 'package:navigation_drawer/widgets/content_cell_widget.dart';
import 'package:navigation_drawer/widgets/header_cell_widget.dart';

class DrawerWidget extends BaseWidget<MainController> {
  
  const DrawerWidget( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Drawer (
      child: Column (        
        children: [
          const DrawerHeader (
            decoration: BoxDecoration(color: Colors.red),
            child: Center( child: Text("Flutter Drawer Header",) ,),
          ),
          Expanded (
            child: ListView.builder (
            itemCount: controller.getLength(),
            itemBuilder: (BuildContext context, int index) {
              if (controller.isHeader(index)) {
                return HeaderCellWidget (
                  controller.getText(index), 
                  controller.isExpand(index),
                  () {
                    if (controller.isExpand(index).isTrue) {
                      controller.setCompress(index);
                    } else {
                      controller.setExpand(index);
                    }
                  }
                );
              } else if (!controller.isHeader(index)) {
                return ContentCellWidget (
                  controller.getText(index), 
                  controller.isExpand(index),
                  () {
                    controller.onTap("ContentCellWidget", index);
                  }
                );
              } else {
                return const SizedBox();
              }
          } )
          ),
        ],
      ),
    );
  }
}