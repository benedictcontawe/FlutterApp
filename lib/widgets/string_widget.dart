import 'package:dart_hive/controllers/primitive_controller.dart';
import 'package:dart_hive/widgets/base_widgets.dart';
import 'package:dart_hive/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StringWidget extends BaseWidget<PrimitiveController> {
  
  const StringWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row (
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded (
            child: TextField (
              controller: controller.getStringController(),
              decoration: InputDecoration (
                hintText: 'Enter String Value',
                labelText: 'String value',
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
                  controller.updateString();
              },
            ),
          ),
          Flexible(
            child: Obx( () {
              return Text (
                controller.getString(), 
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