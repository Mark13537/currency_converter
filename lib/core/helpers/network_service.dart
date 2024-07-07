import 'package:currency_converter/core/error/exception_handler_mixin.dart';
import 'package:currency_converter/core/error/failure.dart';
import 'package:currency_converter/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<BaseException, Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<BaseException, Response>> post(
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

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );
  @override
  String get baseUrl => Constants.baseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.options.headers = header;

    return header;
  }

  @override
  Future<Either<BaseException, Response>> post(String endpoint,
      {Map<String, dynamic>? data}) {
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
  Future<Either<BaseException, Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
