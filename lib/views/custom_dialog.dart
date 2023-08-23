import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/util/hex_color.dart';
import 'package:getx_storage/widgets/button_widget.dart';

class CustomDialog {
  static addDialog ( 
    TextEditingController? controller,
    RxBool liveLoading, RxString liveFileName, RxString liveFileExtension, RxString liveFileSize, Rx<Uint8List> liveFileBytes,
    GestureTapCallback onPressedMedia, VoidCallback? onConfirm 
  ) {
    Get.defaultDialog (
      barrierDismissible: true,
      content: Column(
        children: [
          TextField (
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
          Obx(() {
            if (liveLoading.value) {
              return const SizedBox( height: 10.0,);
            } else {
              return ButtonWidget (
                text: "+ Add Media", 
                textColor: Colors.purple, 
                fillColor: Colors.white,
                onPressed: onPressedMedia
              );
            }
          }),
          Obx(() {
            //debugPrint("liveFileBytes ${liveFileBytes.value}");
            if (liveLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (liveFileExtension.value.toLowerCase().contains("jpg") || liveFileExtension.value.toLowerCase().contains("png") || liveFileExtension.value.toLowerCase().contains("webp")/*liveFileBytes.value == Uint8List.fromList([0])*/) {
              return SizedBox (
                height: 100,
                width: 100,
                child: Column (
                  children: [
                    Image.memory (
                      liveFileBytes.value,
                      fit: BoxFit.scaleDown,
                      height: 100,
                      width: 100,
                    ),
                  ],
                )
              );
            } else {
              return const SizedBox (
                height: 100,
                width: 100,
                child: Icon (
                  CupertinoIcons.photo_camera_solid,
                  color: Colors.blue,
                ),
              );
            }
          },),
          Obx(() => Text (
            "${liveFileName.value}.${liveFileExtension} ${liveFileSize.value}",
            style:  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),)
        ],
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
          ButtonWidget (
            text: "Update", 
            onPressed: onPressed 
          )
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