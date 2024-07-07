import 'package:currency_converter/core/error/failure.dart';
import 'package:currency_converter/features/home/data/datasource/home_remote_data_source.dart';
import 'package:currency_converter/features/home/domain/repositories/home_repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<Either<BaseException, String>> getLatest() {
    // TODO: implement getLatest
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseException, String>> getSymbols() {
    // TODO: implement getSymbols
    throw UnimplementedError();
  }
}
