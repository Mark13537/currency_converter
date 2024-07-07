abstract interface class HomeRemoteDataSource {
  Future<String> getSymbols();
  Future<String> getLatest();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
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
