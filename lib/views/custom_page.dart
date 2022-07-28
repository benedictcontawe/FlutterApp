import 'package:flutter/material.dart';
import 'package:get_x/controllers/CustomController.dart';
import 'package:get_x/views/base_view.dart';
import 'package:get_x/widgets/custom_widget.dart';

class CustomPage extends BaseView<CustomController> {
  
  const CustomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomWidget(),
    );
  }
}