import 'package:getx_storage/controllers/main_controller.dart';
import 'package:getx_storage/widgets/base_widgets.dart';
import 'package:getx_storage/widgets/boolean_widget.dart';
import 'package:flutter/material.dart';
import 'package:getx_storage/widgets/double_widget.dart';
import 'package:getx_storage/widgets/integer_widget.dart';
import 'package:getx_storage/widgets/string_widget.dart';

class MainWidget extends BaseWidget<MainController> {
  
  const MainWidget( { super.key } );

  @override
  Widget build(BuildContext context) {      
    return Column (
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BooleanWidget(),
              const StringWidget(),
              const IntegerWidget(),
              const DoubleWidget(),
            ],
          );
  }
}