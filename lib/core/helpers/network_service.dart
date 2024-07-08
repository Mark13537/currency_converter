import 'package:currency_converter/core/error/exception_handler_mixin.dart';
import 'package:currency_converter/core/secrets/app_secrets.dart';
import 'package:currency_converter/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;
  DioNetworkService(this.dio) {
    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  Options get dioBaseOptions => Options(
        headers: headers,
      );
  @override
  String get baseUrl => Constants.baseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
        'apikey': AppSecrets.apiKey
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.options.headers = header;

    return header;
  }

  @override
  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () {
        return dio.get(baseUrl + endpoint,
            queryParameters: queryParameters, options: dioBaseOptions);
      },

      // => dio.get(
      //   endpoint,
      //   queryParameters: queryParameters,
      // ),
      endpoint: endpoint,
    );
    return res;
  }
}
