import 'package:currency_converter/core/helpers/network_service.dart';

abstract interface class HomeRemoteDataSource {
  Future<String> getSymbols();
  Future<String> getLatest();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final NetworkService networkService;
  HomeRemoteDataSourceImpl(this.networkService);

  @override
  Future<String> getLatest() {
    // TODO: implement getLatest
    throw UnimplementedError();
  }

  @override
  Future<String> getSymbols() {
    // TODO: implement getSymbols
    throw UnimplementedError();
  }
}
