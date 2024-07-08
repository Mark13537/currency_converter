import 'package:currency_converter/features/home/data/datasource/currency_remote_data_source.dart';
import 'package:currency_converter/features/home/domain/entities/currency_exchange_rate.dart';
import 'package:currency_converter/features/home/domain/entities/symbol.dart';

abstract interface class CurrencyRepository {
  Future<List<CurrencySymbol>> getSymbols();
  Future<CurrencyExchangeRates> getLatest({
    String baseCurrency = 'inr',
  });
}

class CurrencyRepositoryImpl implements CurrencyRepository {
  final RemoteCurrencyDataSource _dataSource;

  const CurrencyRepositoryImpl({
    required RemoteCurrencyDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<List<CurrencySymbol>> getSymbols() async {
    return _dataSource.getSymbols();
  }

  @override
  Future<CurrencyExchangeRates> getLatest({
    String baseCurrency = 'inr',
  }) {
    return _dataSource.getLatest(baseCurrency: baseCurrency);
  }
}
