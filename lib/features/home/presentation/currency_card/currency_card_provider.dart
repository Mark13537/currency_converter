import 'package:currency_converter/features/home/domain/entities/exchange_rate.dart';
import 'package:currency_converter/features/home/domain/entities/symbol.dart';
import 'package:currency_converter/features/home/presentation/providers/currency_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'currency_card_provider.g.dart';

class CurrencyCardProvider = CurrencyCardProviderBase
    with _$CurrencyCardProvider;

abstract class CurrencyCardProviderBase with Store {
  @observable
  var currency = CurrencySymbol(
    symbol: 'INR',
    name: 'India',
    flagUrl: 'https://flagsapi.com/IN/flat/64.png',
  );
  @observable
  var convertedAmt = '0';
  @observable
  var currencyProvider = GetIt.I.get<CurrencyProvider>();

  @action
  void calculateConvertedAmt(String value) {
    List<Rate> rateList = currencyProvider.currentExchangeRates.exchangeRates;

    Rate? exchangeRate;

    for (var element in rateList) {
      if (element.currencyName == currency.symbol) {
        exchangeRate = element;
      }
    }
    final convertedValue =
        (double.tryParse(value) ?? 0) / (exchangeRate?.rate ?? 1);
    convertedAmt = convertedValue.toStringAsFixed(1);
  }
}
