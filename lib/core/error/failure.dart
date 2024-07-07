import 'package:currency_converter/core/utils/constants.dart';

enum ExceptionType {
  ioException,
  timeout,
  socket,
  dioException,
  unknown,
}

class BaseException implements Exception {
  String errorMsg;
  Exception? exceptionInfo;
  ExceptionType type;

  BaseException({
    this.errorMsg = Constants.genericErrorMsg,
    this.exceptionInfo,
    required this.type,
  });
}
