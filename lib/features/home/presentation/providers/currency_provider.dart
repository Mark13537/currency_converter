import 'package:currency_converter/features/home/domain/entities/currency_exchange_rate.dart';
import 'package:currency_converter/features/home/domain/entities/symbol.dart';
import 'package:currency_converter/features/home/domain/usecases/currency_usecase.dart';
import 'package:currency_converter/features/home/presentation/currency_card/currency_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'currency_provider.g.dart';

class CurrencyProvider = CurrencyProviderBase with _$CurrencyProvider;

abstract class CurrencyProviderBase with Store {
  @observable
  CurrencyUsecase? usecase = GetIt.I.get<CurrencyUsecase>();

  @observable
  List<CurrencySymbol> allCurrencys = <CurrencySymbol>[];

  @observable
  ObservableList<Widget> operations = ObservableList<Widget>();

  @observable
  CurrencySymbol opCurrency = CurrencySymbol(
    symbol: 'INR',
    name: 'India',
    flagUrl: 'https://flagsapi.com/IN/flat/64.png',
  );

  @observable
  String opResult = '0';

  @observable
  CurrencyExchangeRates currentExchangeRates = CurrencyExchangeRates();

  @action
  Future getCurrencySymbols() async {
    try {
      allCurrencys = await usecase!.getAllCurrencySymbols();
      currentExchangeRates = await usecase!.getLatestExchangeRates();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @action
  void calculateResult({required List<String> operations}) {
    double result = 0.0;

    for (var element in operations) {
      result = result + (double.tryParse(element) ?? 0.0);
    }
    opResult = result.toStringAsFixed(2);
  }

  @action
  Future<void> updateCurrentExchangeRates() async {
    currentExchangeRates = await usecase!.getLatestExchangeRates(
      baseCurrency: opCurrency.symbol,
    );
  }

  @action
  void resetCalculator() {
    operations.clear();
    opResult = '0';
    operations.add(CurrencyCard(isRemovable: false));
  }

  @action
  void addCard() {
    operations.add(CurrencyCard(isRemovable: false));
  }
}
