import 'package:dart_hive/controllers/object_controller.dart';
import 'package:dart_hive/views/custom_dialog.dart';
import 'package:dart_hive/widgets/base_widgets.dart';
import 'package:dart_hive/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListWidget extends BaseWidget<ObjectController> {
  
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      return ListView.builder (
        itemCount: controller.getLength(),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.android),
                  dense: true,
                  title: Text("${controller.getName(index)}", maxLines: 1, overflow: TextOverflow.ellipsis,),
                  trailing: Column(
                    children: [
                    Flexible(
                      child: ButtonWidget (
                        text: "Edit", 
                        onPressed: () {
                          controller.setController(index);
                          CustomDialog.editDialog(
                            controller.getController(),
                            () {
                              controller.updateName(index);
                            },
                          );
                        },
                      ),
                    ),
                    Flexible (
                        child: ButtonWidget (
                        text: "Delete", 
                        onPressed: () {
                          controller.delete(index);
                        },
                      ),
                    )
                  ]
                ),
              )
              ],
            ),
          );
        }
      );   
    }, );
  }
}