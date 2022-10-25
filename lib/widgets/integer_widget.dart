import 'package:dart_hive/controllers/primitive_controller.dart';
import 'package:dart_hive/widgets/base_widgets.dart';
import 'package:dart_hive/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntegerWidget extends BaseWidget<PrimitiveController> {
  
  const IntegerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row (
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded (
            child: TextField (
              controller: controller.getIntegerController(),
              decoration: InputDecoration (
                hintText: 'Enter Integer Value',
                labelText: 'Integer value',
              ),
              enabled: true,
              maxLength: 10,
              maxLines: 1,
              obscureText: false,
              keyboardType: TextInputType.text,
            ),
          ),
          Flexible (
            child: ButtonWidget (
              text: "Update", 
              onPressed: () {
                  controller.updateInteger();
              },
            ),
          ),
          Flexible(
            child: Obx( () {
              return Text (
                controller.getInteger().toString(), 
                style: const TextStyle (
                  color: Colors.black, 
                  fontSize: 20
                ),
              );
            } ),
          )
        ],
      ),
    );
  }
}