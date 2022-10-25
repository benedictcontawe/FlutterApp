import 'package:dart_hive/controllers/primitive_controller.dart';
import 'package:dart_hive/views/base_view.dart';
import 'package:dart_hive/widgets/primitive_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimitivePage extends BaseView<PrimitiveController> {
  const PrimitivePage( {Key? key} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("MainPage build");
    debugPrint("MainPage initialized ${controller.initialized}");
    debugPrint("MainPage isClosed ${controller.isClosed}");
    return Scaffold (
      appBar: AppBar (
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.refresh), 
            onPressed: () {
              controller.updatePrimitives();
            }),
        ],
        elevation: 0,
        title: const Text(
          "Flutter App",
          style: TextStyle(
            fontFamily: "avenir",
            fontSize: 32,
            fontWeight: FontWeight.w900
          ),
        ),
      ),
      body: const PrimitiveWidget(),
    );
  }
}