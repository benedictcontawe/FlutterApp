import 'package:dart_camera/controllers/main_controller.dart';
import 'package:dart_camera/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Column (
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton (
          onPressed: () async {
            controller.launchCamera();
          }, 
          child: const Text("Camera")
        ),
        ElevatedButton (
          onPressed: () async {
            controller.launchVideo();
          },  
          child: const Text("Video")
        ),
      ],
    );
  }
}