import 'package:currency_converter/features/home/data/datasource/currency_remote_data_source.dart';
import 'package:currency_converter/features/home/domain/entities/currency_exchange_rate.dart';
import 'package:currency_converter/features/home/domain/entities/symbol.dart';
import 'package:currency_converter/features/home/domain/repositories/currency_repository.dart';

class HomeRepositoryImpl implements CurrencyRepository {
  final RemoteCurrencyDataSource remoteCurrencyDataSource;

  const HomeRepositoryImpl({
    required this.remoteCurrencyDataSource,
  });

  @override
  Future<CurrencyExchangeRates> getLatest({
    String baseCurrency = 'inr',
  }) {
    return remoteCurrencyDataSource.getLatest(baseCurrency: baseCurrency);
  }

  @override
  Future<List<CurrencySymbol>> getSymbols() {
    return remoteCurrencyDataSource.getSymbols();
  }
}
