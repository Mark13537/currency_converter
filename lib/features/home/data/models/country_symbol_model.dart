import 'package:currency_converter/features/home/data/models/corrency_exchange_model.dart';
import 'package:currency_converter/features/home/domain/entities/symbol.dart';

class CountrySymbolModel extends CurrencySymbol {
  CountrySymbolModel({
    required super.symbol,
    required super.name,
    super.flagUrl,
    List<CurrencyExchangesRateModel> super.allexchangeRates = const [],
  });
}
