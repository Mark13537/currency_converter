// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_card_provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrencyCardProvider on CurrencyCardProviderBase, Store {
  late final _$currencyAtom =
      Atom(name: 'CurrencyCardProviderBase.currency', context: context);

  @override
  CurrencySymbol get currency {
    _$currencyAtom.reportRead();
    return super.currency;
  }

  @override
  set currency(CurrencySymbol value) {
    _$currencyAtom.reportWrite(value, super.currency, () {
      super.currency = value;
    });
  }

  late final _$convertedAmtAtom =
      Atom(name: 'CurrencyCardProviderBase.convertedAmt', context: context);

  @override
  String get convertedAmt {
    _$convertedAmtAtom.reportRead();
    return super.convertedAmt;
  }

  @override
  set convertedAmt(String value) {
    _$convertedAmtAtom.reportWrite(value, super.convertedAmt, () {
      super.convertedAmt = value;
    });
  }

  late final _$currencyProviderAtom =
      Atom(name: 'CurrencyCardProviderBase.currencyProvider', context: context);

  @override
  CurrencyProvider get currencyProvider {
    _$currencyProviderAtom.reportRead();
    return super.currencyProvider;
  }

  @override
  set currencyProvider(CurrencyProvider value) {
    _$currencyProviderAtom.reportWrite(value, super.currencyProvider, () {
      super.currencyProvider = value;
    });
  }

  late final _$CurrencyCardProviderBaseActionController =
      ActionController(name: 'CurrencyCardProviderBase', context: context);

  @override
  void calculateConvertedAmt(String value) {
    final _$actionInfo = _$CurrencyCardProviderBaseActionController.startAction(
        name: 'CurrencyCardProviderBase.calculateConvertedAmt');
    try {
      return super.calculateConvertedAmt(value);
    } finally {
      _$CurrencyCardProviderBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currency: ${currency},
convertedAmt: ${convertedAmt},
currencyProvider: ${currencyProvider}
    ''';
  }
}
