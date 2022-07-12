import 'package:flutter/material.dart';
import 'package:get_x/controllers/CustomController.dart';
import 'package:get_x/widgets/base_widget.dart';

class CustomWidget extends BaseWidget<CustomController> {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {   
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(color: Colors.black,)
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: const Center(child:Text("Sample Splash App")),
          )
        ),
        Expanded(
          child: Container(color: Colors.black,)
        ),
      ],
    );
  }
}