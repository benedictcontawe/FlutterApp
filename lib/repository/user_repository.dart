import 'package:get_x/dio/dio_service.dart';
import 'package:logger/logger.dart';

class UserRepository {
  DioHttpService httpSvc = DioHttpService();
  final logger = Logger();
  UserRepository();
}