import 'package:camera/camera.dart';
import 'package:dart_camera/utils/media_size_clipper.dart';
import 'package:dart_camera/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class CameraPreviewWidget extends BaseWidget {

  const CameraPreviewWidget( { 
    super.key,
    required this.mediaSizeClipper,
    required this.scale,
    required this.cameraController,
  } );

  final MediaSizeClipper mediaSizeClipper;
  final double scale;
  final CameraController cameraController;

  @override
  Widget build(BuildContext context) {
    return ClipRect (
        clipper: mediaSizeClipper,
        child: Transform.scale (
          scale: scale,
          alignment: Alignment.topCenter,
          child: CameraPreview(cameraController),
        ),
      );
  }  
}