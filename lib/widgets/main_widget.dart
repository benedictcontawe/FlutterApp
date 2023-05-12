import 'package:dart_http/controllers/main_controller.dart';
import 'package:dart_http/widgets/base_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(child: CircularProgressIndicator()),
        Text("Pick Files"),
        ElevatedButton(
          onPressed: () async {
            controller.onPickFiles(false);
          }, 
          child: Text("Pick File")
        ),
        ElevatedButton(
          onPressed: () async {
            controller.onPickFiles(true);
          }, 
          child: Text("Pick Multiple")
        ),
      ],
    );
  }
}