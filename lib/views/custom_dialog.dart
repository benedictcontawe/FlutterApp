import 'package:dart_http/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static addDialog(TextEditingController? controller, VoidCallback? onConfirm) {
    Get.defaultDialog(
      barrierDismissible: true,
      content: TextField (
        controller: controller,
        decoration: const InputDecoration (
          hintText: 'Enter Name',
          labelText: 'Name',
        ),
        enabled: true,
        //maxLength: 10,
        maxLines: 1,
        obscureText: false,
        keyboardType: TextInputType.text,
      ),
      onConfirm: onConfirm,
      radius: 1,
      textConfirm: "Add",
      title: "Add Name",
    );
  }

  static editDialog(TextEditingController? controller, GestureTapCallback onPressed) {
    Get.dialog(
      AlertDialog (
        actions: [
          ButtonWidget(text: "Update", onPressed: onPressed)
        ],
        content: TextField (
          controller: controller,
          decoration: const InputDecoration (
            hintText: 'Update Name',
            labelText: 'Name',
          ),
          enabled: true,
          //maxLength: 10,
          maxLines: 1,
          obscureText: false,
          keyboardType: TextInputType.text,
        ),
        title: const Text("Update"),
      ),
      barrierDismissible: true,
    );
  }
}