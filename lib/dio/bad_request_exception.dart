import 'package:dio/dio.dart';

class BadRequestException extends DioException {

  BadRequestException(RequestOptions requestOptions) : super(requestOptions: requestOptions);

  @override
  String toString() {
    return '${this.type} ${this.error} ${this.message} ${requestOptions.method} ${requestOptions.data} Invalid request';
  }
}