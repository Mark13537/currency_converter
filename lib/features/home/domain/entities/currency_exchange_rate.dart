import 'package:currency_converter/features/home/domain/entities/exchange_rate.dart';

class CurrencyExchangeRates {
  final String currencyName;
  final List<Rate> exchangeRates;

  CurrencyExchangeRates({
    this.exchangeRates = const [],
    this.currencyName = '',
  });
}
