import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

class BaseController extends GetxController {

  final Logger? _logger = Get.find<Logger>(tag: 'Logger');
   
  @override
  onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @protected
  void logDebug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.d(message, error, stackTrace);
  }

  @protected
  void logInfo(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.i(message, error, stackTrace);
  }

  @protected
  void logError(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.e(message, error, stackTrace);
  }

  @override
  void onClose() {
    _logger?.close();
    _logger == null;
    super.onClose();
  }
}