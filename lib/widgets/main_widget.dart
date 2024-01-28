import 'package:dart_file_picker/controllers/main_controller.dart';
import 'package:dart_file_picker/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Column (
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //const Center(child: CircularProgressIndicator()),
        const Text("Pick Files"),
        ElevatedButton(
          onPressed: () async {
            controller.onPickFile();
          }, 
          child: const Text("Pick File")
        ),
        ElevatedButton(
          onPressed: () async {
            controller.onPickFiles();
          },  
          child: const Text("Pick Multiple")
        ),
      ],
    );
  }
}