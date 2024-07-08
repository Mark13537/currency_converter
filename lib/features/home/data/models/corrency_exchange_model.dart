import 'package:currency_converter/features/home/data/models/rate_model.dart';
import 'package:currency_converter/features/home/domain/entities/currency_exchange_rate.dart';

class CurrencyExchangesRateModel extends CurrencyExchangeRates {
  CurrencyExchangesRateModel({
    super.currencyName,
    List<RateModel> super.exchangeRates = const [],
  });
}
