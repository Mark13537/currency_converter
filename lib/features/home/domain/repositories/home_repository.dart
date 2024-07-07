import 'package:currency_converter/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class HomeRepository {
  Future<Either<BaseException, String>> getSymbols();
  Future<Either<BaseException, String>> getLatest();
}
