import 'package:flutter/material.dart';
import 'package:getx_storage/controllers/main_controller.dart';
import 'package:getx_storage/widgets/base_widgets.dart';
import 'package:getx_storage/widgets/button_widget.dart';

class IntegerWidget extends BaseWidget<MainController> {
  
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
                  
              },
            ),
          ),
          Flexible(
            child: Text (
              'Value', 
              style: const TextStyle (
                color: Colors.black, 
                fontSize: 20
              ),
            ),
          )
        ],
      ),
    );
  }
}