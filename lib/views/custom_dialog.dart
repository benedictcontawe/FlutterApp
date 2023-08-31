import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_storage/util/constants.dart';
import 'package:getx_storage/widgets/button_widget.dart';

class CustomDialog {

  static bool _isImageExtension(String fileExtension) { /*liveFileBytes.value == Uint8List.fromList([0])*/
    return fileExtension.toLowerCase().contains("jpg") 
    || fileExtension.toLowerCase().contains("png") 
    || fileExtension.toLowerCase().contains("webp");
  }

  static addDialog ( 
    TextEditingController? controller,
    RxBool liveLoading, RxString liveFileName, RxString liveFileExtension, RxString liveFileSize, Rx<Uint8List> liveFileBytes,
    GestureTapCallback onPressedMedia, VoidCallback? onConfirm 
  ) {
    Get.defaultDialog (
      barrierDismissible: true,
      content: Column (
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
            if (liveLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (_isImageExtension(liveFileExtension.value)) {
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
          Obx(() {
            if (_isImageExtension(liveFileExtension.value)) {
              return  Text (
                "${liveFileName.value}.${liveFileExtension} ${liveFileSize.value}",
                style:  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              );
            } else {
              return const SizedBox ();
            }
          },),
        ],
      ),
      onConfirm: onConfirm,
      radius: 1,
      textConfirm: "Add",
      title: "Add Name",
    );
  }

  static editDialog (
    TextEditingController? controller,
    RxBool liveLoading, RxString liveFileName, RxString liveFileExtension, RxString liveFileSize, Rx<Uint8List> liveFileBytes,
    String icon,
    GestureTapCallback onPressedMedia, GestureTapCallback onPressed
  ) {
    Get.dialog (
      AlertDialog (
        actions: [
          ButtonWidget (
            text: "Update", 
            onPressed: onPressed 
          )
        ],
        content: Column (
          children: [
            TextField (
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
            ButtonWidget (
                text: "Edit Media", 
                textColor: Colors.purple, 
                fillColor: Colors.white,
                onPressed: onPressedMedia
            ),
             Obx(() {
              if (liveLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (_isImageExtension(liveFileExtension.value)) {
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
              } else if (icon != Constants.NIL) {
                return Image.network (
                    icon,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    errorBuilder: ( (context, error, stackTrace) {
                      debugPrint("Custom Dialog editDialog errorBuilder ${error.toString()} ${stackTrace.toString()}");
                      return const Icon (
                        Icons.broken_image,
                        color: Colors.red,
                        size: 30.0,
                      );
                    } ),
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
          ],
        ),
        title: const Text("Update"),
      ),
      barrierDismissible: true,
    );
  }

  static loadingDialog () {
    Get.dialog (
      AlertDialog (
        backgroundColor: Constants.transparentColor,
        elevation: 0.00,
        content: const Center (
          child: CircularProgressIndicator()
        ),
        surfaceTintColor: Constants.transparentColor,
      ),
      barrierDismissible: false,
    );
  }
}