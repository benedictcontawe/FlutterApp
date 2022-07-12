import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:get_x/constants.dart';
import 'package:get_x/dio/api_method.dart';
import 'package:get_x/dio/bad_request_exception.dart';

class DioHttpService {
  Dio? _dio;
  final _logger = Logger();

  var defaultHeader = {"Content-Type": "application/json"};
  var defaultOptions = {
    "followRedirects": false,
    "validateStatus": (status) {
      return status < 500;
    }
  };

  Future<DioHttpService> initialize(String? baseUrl, int? connectTimeout, int? receiveTimeout) async {
    _dio = Dio( BaseOptions (
        baseUrl: baseUrl ?? Constants.BASE_URL,
        connectTimeout: connectTimeout ?? 3000,
        receiveTimeout: receiveTimeout ?? 3000,
        responseType: ResponseType.json));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          _logger.i("""
            REQUEST: ${requestOptions.method}
            URL: "${requestOptions.baseUrl + requestOptions.path}"
            HEADERS: ${requestOptions.headers}
            POST DATA: ${requestOptions.data}
            REQUEST PARAMS: ${requestOptions.queryParameters}              
          """);
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          _logger.i("""
            RESPONSE[${response.statusCode}]
            DATA: ${response.data}
          """);
          return handler.next(response);
        },
        onError: (err, handler) {
          _logger.e("""
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
      _logger.e(e);
      throw Exception('Something went wrong');
    }
  }
}