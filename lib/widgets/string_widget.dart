import 'package:flutter/material.dart';
import 'package:getx_storage/controllers/main_controller.dart';
import 'package:getx_storage/widgets/base_widgets.dart';
import 'package:getx_storage/widgets/button_widget.dart';

class StringWidget extends BaseWidget<MainController> {
  
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