
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_storage/controllers/object_controller.dart';
import 'package:getx_storage/views/base_view.dart';
import 'package:getx_storage/views/custom_dialog.dart';
import 'package:getx_storage/widgets/app_bar_widget.dart';
import 'package:getx_storage/widgets/object_widget.dart';

class ObjectPage extends BaseView<ObjectController> {
  
  const ObjectPage( {
    super.key
  } );

  @override
  Widget build(BuildContext context) {
    return Scaffold ( 
      appBar: const AppBarWidget(),
      body: const ObjectWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding (
        padding: const EdgeInsets.all(8.0),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton (
              child: const Icon ( CupertinoIcons.add ),
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
              child: const Icon ( CupertinoIcons.delete ),
              onPressed: () {
                controller.deleteAll();
              },
            )
          ],
        ),
      ),
    );
  }
}