import 'package:camera/camera.dart';
import 'package:dart_camera/controllers/base_controller.dart';
import 'package:dart_camera/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';

class MainController extends BaseController {

  MainController() {
    debugPrint("MainController Constructor");
  }

  late final CameraController? cameraController;
  late final List<CameraDescription>? _cameraList;
  late final CameraDescription? _firstCamera, _secondCamera;
  final RxBool _isRecording = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("MainController onInit");
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    debugPrint("MainController _initializeCamera");
    try { //TODO: Web Camera not supported yet! library that will be use is camera_web
      _cameraList = await availableCameras();
      _firstCamera = _cameraList?.first;
      _secondCamera = _cameraList?[1];
      cameraController = new CameraController(_secondCamera!!, ResolutionPreset.veryHigh);
      debugPrint("MainController _cameraList ${_cameraList?.length}");
    } on CameraException catch (code, description) {
      debugPrint("MainController _initializeCamera CameraException $code $description");
      onShowAlert("CameraException", "$description");
    }
  }

  double getScale(Size mediaSize) {
    return 1 / (cameraController!.value.aspectRatio * mediaSize.aspectRatio);
  }

  void launchCamera() {
    Get.toNamed(Routes.CAMERA);
  }

  void launchVideo() {
    Get.toNamed(Routes.VIDEO);
  }

  Future<void> getCameraFuture() {
    return cameraController!.initialize();
  }

  void playShutter() {
    //TODO: Still not supported will need to use these library either just_audio: ^0.9.36 or audioplayers: ^5.2.1
  }

  Future<void> playVibrate() async {
    if (await Vibrate.canVibrate) {
      //Vibrate.vibrate();
      Vibrate.feedback(FeedbackType.heavy);
      /*
      final Iterable<Duration> pauses = [
          const Duration(milliseconds: 100),
          const Duration(milliseconds: 500),
      ];
      Vibrate.vibrateWithPauses(pauses);
      */
    }    
  }

  Future<void> takePicture() async {
    debugPrint("MainController takePicture");
    try {
      final XFile? image = await cameraController?.takePicture();
      //Image.file(File(image.path))
      debugPrint("MainController takePicture ${image?.path}");
    } on CameraException catch (code, description) {
      debugPrint("MainController takePicture CameraException $code $description");
      onShowAlert("CameraException", "$description");
    }
  }

  RxBool observeRecording() {
    return _isRecording;
  }

  Future<void> toggleRecording() async {
    if (_isRecording.isTrue) {
      //cameraController?.pauseVideoRecording();
      final XFile? video = await cameraController?.stopVideoRecording();
      debugPrint("MainController toggleRecording ${video?.path}");
      _isRecording(false);
    } else if (_isRecording.isFalse) {
      cameraController?.startVideoRecording();
      _isRecording(true);
    }
  }

  void flipCamera() {
    if (cameraController?.description == _firstCamera) {
      cameraController?.setDescription(_secondCamera!!);
    } else if (cameraController?.description == _secondCamera) {
      cameraController?.setDescription(_firstCamera!!);
    }
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint("MainController onClose");
    cameraController?.dispose();
  }
}