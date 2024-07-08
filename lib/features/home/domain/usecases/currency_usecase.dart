import 'package:currency_converter/features/home/domain/entities/currency_exchange_rate.dart';
import 'package:currency_converter/features/home/domain/entities/symbol.dart';
import 'package:currency_converter/features/home/domain/repositories/currency_repository.dart';

abstract class CurrencyUsecase {
  Future<CurrencyExchangeRates> getLatestExchangeRates({
    String baseCurrency = 'inr',
  });

  Future<List<CurrencySymbol>> getAllCurrencySymbols();
}

class CurrencyUsecaseImpl implements CurrencyUsecase {
  final CurrencyRepository _repository;

  const CurrencyUsecaseImpl({
    required CurrencyRepository repository,
  }) : _repository = repository;

  @override
  Future<List<CurrencySymbol>> getAllCurrencySymbols() async {
    return _repository.getSymbols();
  }

  @override
  Future<CurrencyExchangeRates> getLatestExchangeRates({
    String baseCurrency = 'inr',
  }) {
    return _repository.getLatest(baseCurrency: baseCurrency);
  }
}
