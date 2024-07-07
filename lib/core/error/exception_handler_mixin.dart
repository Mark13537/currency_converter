import 'dart:async';
import 'dart:io';

import 'package:currency_converter/core/error/failure.dart';
import 'package:currency_converter/core/helpers/network_service.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<BaseException, Response>> handleException<T extends Object>(
      Future<Response<dynamic>> Function() handler,
      {String endpoint = ''}) async {
    try {
      final res = await handler();
      return Right(
        Response(
          statusCode: res.statusCode ?? 200,
          data: res.data,
          statusMessage: res.statusMessage,
          requestOptions: res.requestOptions,
        ),
      );
    } catch (e) {
      String message = '';
      ExceptionType type = ExceptionType.unknown;

      switch (e.runtimeType) {
        case SocketException():
          message = 'Unable to connect to the server.';
          type = ExceptionType.socket;
          break;

        case DioException():
          e as DioException;
          message = e.response?.data?['message'] ?? 'Internal Error occurred';
          type = ExceptionType.dioException;
          break;

        case TimeoutException():
          message = "Request timeout";
          type = ExceptionType.dioException;
          break;

        case IOException():
          message = "Some IOException";
          type = ExceptionType.ioException;
          break;

        default:
          message = 'Unknown error occurred';
          type = ExceptionType.unknown;
      }
      return Left(
        BaseException(
          errorMsg: message,
          type: type,
          exceptionInfo: (e is Exception) ? e : null,
        ),
      );
    }
  }
}
