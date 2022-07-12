import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

abstract class BaseBinding extends Bindings {

  Logger? _logger;

  void _intialize() {
    _logger ??= Logger();
  }

  @override
  void dependencies() {
    Get.create<Logger> ( () => Logger(), tag: "Logger");
  }

  @protected
  void logDebug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _intialize(); 
    _logger?.d(message, error, stackTrace);
  }

  @protected
  void logInfo(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _intialize();
    _logger?.i(message, error, stackTrace);
  }

  @protected
  void logError(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _intialize();
    _logger?.e(message, error, stackTrace);
  }
}