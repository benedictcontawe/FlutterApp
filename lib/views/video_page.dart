import 'package:camera/camera.dart';
import 'package:dart_camera/controllers/main_controller.dart';
import 'package:dart_camera/utils/media_size_clipper.dart';
import 'package:dart_camera/views/base_view.dart';
import 'package:dart_camera/widgets/camera_preview_widget.dart';
import 'package:dart_camera/widgets/floating_action_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoPage extends BaseView<MainController> {
  
  const VideoPage( { Key? key } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: FutureBuilder<void> (
        future: controller.getCameraFuture(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreviewWidget (
              mediaSizeClipper: MediaSizeClipper(MediaQuery.of(context).size),
              scale: controller.getScale(MediaQuery.of(context).size),
              cameraController: controller.cameraController!,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButtonWidget (
        centerBottomIcon: const Icon(CupertinoIcons.video_camera), 
        bottomTrailIcon: const Icon(CupertinoIcons.arrow_2_circlepath), 
        onPressedCenterBottomIcon: () { controller.toggleRecording(); }, 
        onPressedBottomTrailIcon: () { controller.flipCamera(); },
      ),
    );
  }
}