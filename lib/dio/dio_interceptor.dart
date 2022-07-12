import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioInterceptor extends Interceptor {

  Logger? _logger;

 @override
  void onRequest(RequestOptions requestOptions, RequestInterceptorHandler handler) {
    /*
    // 1. Add userId to private endpoints
    // Suppose the path containss open is public
    if(!options.path.contains("open")) {
      options.queryParameters["userId"] = "xxx";
    }

    // 2. Validate the user and append the token
    // token can be obtained from the shared preference
    options.headers["token"] = "xxx";

    // 3. Requesting a refresh token
    if (options.headers['refreshToken'] == null) {
      DioClient.dio.lock();
      Dio _tokenDio = Dio();
      _tokenDio.get('/token').then((d) {
        options.headers['refreshToken'] = d.data['data']['token'];
        handler.next(options);
      }).catchError((onError, stackTrace) {
        handler.reject(error, true);
      }).whenComplete(() {
        dio.unlock();
      });
    }
    */
   return super.onRequest(requestOptions, handler);
  } 

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {

    } else {

    }
    if (response.requestOptions.baseUrl.contains("secret")) {

    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    switch (error.type) {
      case DioErrorType.connectTimeout: {

      } break;
      case DioErrorType.receiveTimeout: {

      } break;
      case DioErrorType.sendTimeout: {

      } break;
      case DioErrorType.cancel: {

      } break;
      case DioErrorType.response: {

      } break;
      case DioErrorType.other: {

      } break;
    }
    return super.onError(error, handler);
  }
}