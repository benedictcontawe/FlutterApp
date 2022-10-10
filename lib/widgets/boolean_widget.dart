import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/controllers/main_controller.dart';
import 'package:getx_storage/widgets/base_widgets.dart';
import 'package:getx_storage/widgets/button_widget.dart';

class BooleanWidget extends BaseWidget<MainController> {

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