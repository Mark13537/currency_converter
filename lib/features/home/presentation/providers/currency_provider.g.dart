// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrencyProvider on CurrencyProviderBase, Store {
  late final _$usecaseAtom =
      Atom(name: 'CurrencyProviderBase.usecase', context: context);

  @override
  CurrencyUsecase? get usecase {
    _$usecaseAtom.reportRead();
    return super.usecase;
  }

  @override
  set usecase(CurrencyUsecase? value) {
    _$usecaseAtom.reportWrite(value, super.usecase, () {
      super.usecase = value;
    });
  }

  late final _$allCurrencysAtom =
      Atom(name: 'CurrencyProviderBase.allCurrencys', context: context);

  @override
  List<CurrencySymbol> get allCurrencys {
    _$allCurrencysAtom.reportRead();
    return super.allCurrencys;
  }

  @override
  set allCurrencys(List<CurrencySymbol> value) {
    _$allCurrencysAtom.reportWrite(value, super.allCurrencys, () {
      super.allCurrencys = value;
    });
  }

  late final _$operationsAtom =
      Atom(name: 'CurrencyProviderBase.operations', context: context);

  @override
  ObservableList<Widget> get operations {
    _$operationsAtom.reportRead();
    return super.operations;
  }

  @override
  set operations(ObservableList<Widget> value) {
    _$operationsAtom.reportWrite(value, super.operations, () {
      super.operations = value;
    });
  }

  late final _$opCurrencyAtom =
      Atom(name: 'CurrencyProviderBase.opCurrency', context: context);

  @override
  CurrencySymbol get opCurrency {
    _$opCurrencyAtom.reportRead();
    return super.opCurrency;
  }

  @override
  set opCurrency(CurrencySymbol value) {
    _$opCurrencyAtom.reportWrite(value, super.opCurrency, () {
      super.opCurrency = value;
    });
  }

  late final _$opResultAtom =
      Atom(name: 'CurrencyProviderBase.opResult', context: context);

  @override
  String get opResult {
    _$opResultAtom.reportRead();
    return super.opResult;
  }

  @override
  set opResult(String value) {
    _$opResultAtom.reportWrite(value, super.opResult, () {
      super.opResult = value;
    });
  }

  late final _$currentExchangeRatesAtom =
      Atom(name: 'CurrencyProviderBase.currentExchangeRates', context: context);

  @override
  CurrencyExchangeRates get currentExchangeRates {
    _$currentExchangeRatesAtom.reportRead();
    return super.currentExchangeRates;
  }

  @override
  set currentExchangeRates(CurrencyExchangeRates value) {
    _$currentExchangeRatesAtom.reportWrite(value, super.currentExchangeRates,
        () {
      super.currentExchangeRates = value;
    });
  }

  late final _$getCurrencySymbolsAsyncAction =
      AsyncAction('CurrencyProviderBase.getCurrencySymbols', context: context);

  @override
  Future<dynamic> getCurrencySymbols() {
    return _$getCurrencySymbolsAsyncAction
        .run(() => super.getCurrencySymbols());
  }

  late final _$updateCurrentExchangeRatesAsyncAction = AsyncAction(
      'CurrencyProviderBase.updateCurrentExchangeRates',
      context: context);

  @override
  Future<void> updateCurrentExchangeRates() {
    return _$updateCurrentExchangeRatesAsyncAction
        .run(() => super.updateCurrentExchangeRates());
  }

  late final _$CurrencyProviderBaseActionController =
      ActionController(name: 'CurrencyProviderBase', context: context);

  @override
  void calculateResult({required List<String> operations}) {
    final _$actionInfo = _$CurrencyProviderBaseActionController.startAction(
        name: 'CurrencyProviderBase.calculateResult');
    try {
      return super.calculateResult(operations: operations);
    } finally {
      _$CurrencyProviderBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCalculator() {
    final _$actionInfo = _$CurrencyProviderBaseActionController.startAction(
        name: 'CurrencyProviderBase.resetCalculator');
    try {
      return super.resetCalculator();
    } finally {
      _$CurrencyProviderBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCard() {
    final _$actionInfo = _$CurrencyProviderBaseActionController.startAction(
        name: 'CurrencyProviderBase.addCard');
    try {
      return super.addCard();
    } finally {
      _$CurrencyProviderBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usecase: ${usecase},
allCurrencys: ${allCurrencys},
operations: ${operations},
opCurrency: ${opCurrency},
opResult: ${opResult},
currentExchangeRates: ${currentExchangeRates}
    ''';
  }
}
