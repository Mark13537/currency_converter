import 'package:currency_converter/core/helpers/network_service.dart';
import 'package:currency_converter/features/home/data/datasource/currency_remote_data_source.dart';
import 'package:currency_converter/features/home/domain/repositories/currency_repository.dart';
import 'package:currency_converter/features/home/domain/usecases/currency_usecase.dart';
import 'package:currency_converter/features/home/presentation/providers/currency_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DI {
  static void disposeModules() {
    GetIt.I.unregister<NetworkService>();

    GetIt.I.unregister<RemoteCurrencyDataSource>();
    GetIt.I.unregister<CurrencyRepository>();
    GetIt.I.unregister<CurrencyUsecase>();
  }

  static void initModules() {
    GetIt.I.registerSingleton<NetworkService>(DioNetworkService(Dio()));

    // data source
    GetIt.I.registerSingleton<RemoteCurrencyDataSource>(
      RemoteCurrencyDataSourceImpl(GetIt.I.get<NetworkService>()),
    );

    // Repository
    GetIt.I.registerSingleton<CurrencyRepository>(
      CurrencyRepositoryImpl(
          dataSource: GetIt.I.get<RemoteCurrencyDataSource>()),
    );
    // Usecase
    GetIt.I.registerSingleton<CurrencyUsecase>(
      CurrencyUsecaseImpl(repository: GetIt.I.get<CurrencyRepository>()),
    );

    //
    GetIt.I.registerSingleton<CurrencyProvider>(
        //CurrencyProvider(usecase: GetIt.I.get<CurrencyUsecase>()),
        CurrencyProvider());
  }
}
