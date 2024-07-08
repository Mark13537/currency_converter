import 'dart:async';
import 'dart:io';

import 'package:currency_converter/core/error/failure.dart';
import 'package:currency_converter/core/helpers/network_service.dart';
import 'package:dio/dio.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Response> handleException<T extends Object>(
      Future<Response<dynamic>> Function() handler,
      {String endpoint = ''}) async {
    try {
      final res = await handler();

      return Response(
        statusCode: res.statusCode ?? 200,
        data: res.data,
        statusMessage: res.statusMessage,
        requestOptions: res.requestOptions,
      );
    } catch (e) {
      String message = '';
      ExceptionType type = ExceptionType.unknown;

      switch (e.runtimeType) {
        case SocketException():
          message = 'Unable to connect to the server.';
          type = ExceptionType.socket;

        case DioException():
          message = 'Some Dio exception';
          type = ExceptionType.dioException;

        case TimeoutException():
          message = 'Request timeout';
          type = ExceptionType.dioException;

        case IOException():
          message = 'Some IOException';
          type = ExceptionType.ioException;

        default:
          message = 'Unknown error occurred';
          type = ExceptionType.unknown;
      }
      throw BaseException(
        errorMsg: message,
        type: type,
        exceptionInfo: (e is Exception) ? e : null,
      );
    }
  }
}
