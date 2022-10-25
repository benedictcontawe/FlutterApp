import 'package:dart_hive/controllers/primitive_controller.dart';
import 'package:dart_hive/widgets/base_widgets.dart';
import 'package:dart_hive/widgets/boolean_widget.dart';
import 'package:dart_hive/widgets/double_widget.dart';
import 'package:dart_hive/widgets/integer_widget.dart';
import 'package:dart_hive/widgets/string_widget.dart';
import 'package:flutter/material.dart';

class PrimitiveWidget extends BaseWidget<PrimitiveController> {
  
  const PrimitiveWidget( { super.key } );

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