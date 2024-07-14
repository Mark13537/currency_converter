import 'package:currency_converter/core/helpers/network_service.dart';
import 'package:currency_converter/features/home/data/models/corrency_exchange_model.dart';
import 'package:currency_converter/features/home/data/models/country_symbol_model.dart';
import 'package:currency_converter/features/home/data/models/rate_model.dart';
import 'package:currency_converter/features/home/domain/entities/currency_exchange_rate.dart';
import 'package:currency_converter/features/home/domain/entities/symbol.dart';

abstract interface class RemoteCurrencyDataSource {
  Future<List<CurrencySymbol>> getSymbols();
  Future<CurrencyExchangeRates> getLatest({
    String baseCurrency = 'inr',
  });
}

class RemoteCurrencyDataSourceImpl implements RemoteCurrencyDataSource {
  final NetworkService networkService;
  RemoteCurrencyDataSourceImpl(this.networkService);

  @override
  Future<CurrencyExchangeRates> getLatest({
    String baseCurrency = 'inr',
  }) async {
    CurrencyExchangesRateModel exchangesRateModel =
        CurrencyExchangesRateModel();

    final response = await networkService.get(
      '/latest',
      queryParameters: {
        'base': baseCurrency,
      },
    );

    if (response.statusCode == 200) {
      final dataMap = response.data as Map<String, dynamic>;
      final data = dataMap['rates'] as Map<String, dynamic>;

      final rates = <RateModel>[];

      data.forEach(
        (key, value) {
          rates.add(
            RateModel(
              currencyName: key,
              rate: double.tryParse(value.toString()) ?? 0,
            ),
          );
        },
      );

      exchangesRateModel = CurrencyExchangesRateModel(
        currencyName: dataMap['base'] as String,
        exchangeRates: rates,
      );
    }

    return exchangesRateModel;
  }

  @override
  Future<List<CurrencySymbol>> getSymbols() async {
    final List<CountrySymbolModel> symbols = [];
    final response = await networkService.get(
      '/symbols',
    );

    if (response.statusCode == 200) {
      final dataMap = response.data as Map<String, dynamic>;
      final data = dataMap['symbols'] as Map<String, dynamic>;

      data.forEach(
        (key, value) {
          symbols.add(
            CountrySymbolModel(
              name: value as String,
              symbol: key,
              flagUrl:
                  'https://flagsapi.com/${key.substring(0, key.length - 1).toUpperCase()}/flat/64.png',
            ),
          );
        },
      );
    }
    return symbols;
  }
}
