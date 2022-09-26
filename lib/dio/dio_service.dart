import 'package:dart_http/constants.dart';
import 'package:dart_http/dio/api_method.dart';
import 'package:dart_http/dio/bad_request_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioService {
  Dio? _dio;

  var defaultHeader = {"Content-Type": "application/json"};
  var defaultOptions = {
    "followRedirects": false,
    "validateStatus": (status) {
      return status < 500;
    }
  };

  Future<DioService> initialize(String? baseUrl, int? connectTimeout, int? receiveTimeout) async {
    _dio = Dio( BaseOptions (
        baseUrl: baseUrl ?? Constants.API_DOMAIN,
        connectTimeout: connectTimeout ?? Constants.TIMEOUT,
        receiveTimeout: receiveTimeout ?? Constants.TIMEOUT,
        responseType: ResponseType.json));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          debugPrint("""
            REQUEST: ${requestOptions.method}
            URL: "${requestOptions.baseUrl + requestOptions.path}"
            HEADERS: ${requestOptions.headers}
            POST DATA: ${requestOptions.data}
            REQUEST PARAMS: ${requestOptions.queryParameters}              
          """);
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          debugPrint("""
            RESPONSE[${response.statusCode}]
            DATA: ${response.data}
          """);
          return handler.next(response);
        },
        onError: (err, handler) {
          debugPrint("""
            ERROR[${err.response?.statusCode}] 
            DATA : ${err.response}
          """);
          return handler.next(err);
        },
      ),
    );
  }

  Future<Response> request( {required String url, required ApiMethod method, Map<String, dynamic>? params, Map<String, dynamic>? requestHeaders} ) async {
    Response response;
    try {
      if (method == ApiMethod.POST) { response = await _dio!.post(url, data: params,
        options: Options(followRedirects: false, validateStatus: (status) { return status! < 500; },
        headers: {...defaultHeader, ...?requestHeaders})
      ); } else if (method == ApiMethod.DELETE) { response = await _dio!.delete(url,
        options: Options(followRedirects: false, validateStatus: (status) { return status! < 500; },
        headers: {...defaultHeader, ...?requestHeaders})
      ); } else if (method == ApiMethod.PATCH) { response = await _dio!.patch(url,
        options: Options(followRedirects: false, validateStatus: (status) { return status! < 500; },
        headers: {...defaultHeader, ...?requestHeaders}));
      } else if (method == ApiMethod.PUT) { response = await _dio!.put(url, data: params,
        options: Options(followRedirects: false, validateStatus: (status) { return status! < 500; },
        headers: {...defaultHeader, ...?requestHeaders})
      ); } else { response = await _dio!.get(url, queryParameters: params,
        options: Options(followRedirects: false, validateStatus: (status) { return status! < 500; },
        headers: {...defaultHeader, ...?requestHeaders})
      ); }
      return response;
    } on DioError catch (e) {
      throw BadRequestException(e.requestOptions);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Something went wrong');
    }
  }
}