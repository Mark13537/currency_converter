import 'package:currency_converter/features/home/domain/entities/currency_exchange_rate.dart';

class CurrencySymbol {
  final String symbol;
  final String name;
  final String flagUrl;

  final List<CurrencyExchangeRates> allexchangeRates;

  CurrencySymbol({
    required this.symbol,
    required this.name,
    this.flagUrl = '',
    this.allexchangeRates = const [],
  });
}
