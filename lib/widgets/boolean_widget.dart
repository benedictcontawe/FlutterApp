import 'package:dart_hive/controllers/primitive_controller.dart';
import 'package:dart_hive/widgets/base_widgets.dart';
import 'package:dart_hive/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooleanWidget extends BaseWidget<PrimitiveController> {

  const BooleanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container (
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              const Text (
                'Boolean Value:',  
                style: const TextStyle(
                  color: Colors.black
                ),
              ),
              Obx( () {
                return Checkbox (
                  value: controller.isChecked(), 
                  onChanged: (value) {
                    controller.setBoolean(value);
                  },
                );
              } ),
            ButtonWidget (
              text: "Update", 
              onPressed: () {
                controller.updateBoolean();
              },
            ),
            Obx( () {
              return Text (
                controller.getBoolean(), 
                style: const TextStyle (
                  color: Colors.black, 
                  fontSize: 20
                ),
              );
            } ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}