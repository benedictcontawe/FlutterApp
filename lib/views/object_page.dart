import 'package:dart_hive/controllers/object_controller.dart';
import 'package:dart_hive/views/base_view.dart';
import 'package:dart_hive/views/custom_dialog.dart';
import 'package:dart_hive/widgets/object_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ObjectPage extends BaseView<ObjectController> {
  const ObjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("ObjectPage build");
    debugPrint("ObjectPage initialized ${controller.initialized}");
    debugPrint("ObjectPage isClosed ${controller.isClosed}");
    return Scaffold( 
      appBar: AppBar (
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.refresh), 
            onPressed: () {
              controller.updateModels();
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
      body: const ObjectWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding (
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget> [
            FloatingActionButton (
              child: const Icon(CupertinoIcons.add),
              onPressed: () {
                controller.resetController();
                CustomDialog.addDialog (
                  controller.getController(), 
                  () {
                    controller.add();
                  },
                );
              },
            ),
            FloatingActionButton (
              child: const Icon(CupertinoIcons.delete),
              onPressed: () {
                controller.deleteAll();
              },
            )
          ],
        ),
      )
    );
  }
}