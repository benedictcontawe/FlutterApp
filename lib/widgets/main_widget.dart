import 'package:getx_storage/controllers/main_controller.dart';
import 'package:getx_storage/widgets/base_widgets.dart';
import 'package:getx_storage/widgets/boolean_widget.dart';
import 'package:flutter/material.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Column (
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BooleanWidget(),
              Expanded(
                child: ColoredBox (
                  child: Center(child:Text("Page 2")),
                  color: Colors.blue,
                ),
              ),

              Expanded(
              child:  ColoredBox (
                  child: Center(child:Text("Page 3")),
                  color: Colors.orange,
                ),
              ),

              Expanded(
                child: ColoredBox (
                  child: Center(child:Text("Page 4")),
                  color: Colors.green,
                ),
              ),

            ],
          );
  }
}