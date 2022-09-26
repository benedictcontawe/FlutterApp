
import 'package:dio/dio.dart';

class BadRequestException extends DioError {

  BadRequestException(RequestOptions requestOptions) : super(requestOptions: requestOptions);

  @override
  String toString() {
    return '${this.type} ${this.error} ${this.message} ${requestOptions.method} ${requestOptions.data} Invalid request';
  }
}