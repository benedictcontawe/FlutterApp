import 'package:get_x/controllers/pin_code_controller.dart';
import 'package:get_x/views/base_view.dart';
import 'package:get_x/widgets/pin_code_widget.dart';
import 'package:flutter/material.dart';

class PinCodePage extends BaseView<PinCodeController> {
  
  PinCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.logDebug("PinCodePage build");
    controller.initialized;
    controller.isClosed;
    return const Scaffold( body: PinCodeWidget(),);
  }
}