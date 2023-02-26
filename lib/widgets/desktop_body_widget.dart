import 'package:dart_media_query/controllers/main_controller.dart';
import 'package:dart_media_query/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class DesktopBodyWidget extends BaseWidget<MainController> {

  const DesktopBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}