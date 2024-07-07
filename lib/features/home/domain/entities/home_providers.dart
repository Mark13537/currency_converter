import 'package:currency_converter/core/helpers/network_service.dart';
import 'package:currency_converter/features/home/data/datasource/home_remote_data_source.dart';
import 'package:currency_converter/features/home/data/repositories/home_repository.dart';
import 'package:currency_converter/features/home/domain/repositories/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceProvider = Provider<DioNetworkService>(
  (ref) {
    final Dio dio = Dio();
    return DioNetworkService(dio);
  },
);

final homeRemoteDatasourceProvider =
    Provider.family<HomeRemoteDataSource, NetworkService>(
  (_, networkService) => HomeRemoteDataSourceImpl(networkService),
);

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(homeRemoteDatasourceProvider(networkService));
  final repository = HomeRepositoryImpl(datasource);

  return repository;
});
