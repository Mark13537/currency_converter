import 'dart:convert';

import 'package:currency_converter/core/helpers/network_service.dart';
import 'package:currency_converter/features/home/data/datasource/currency_remote_data_source.dart';
import 'package:currency_converter/features/home/data/models/corrency_exchange_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixures/fixures.dart';
import '../../fixures/mocks.dart';

void main() {
  late NetworkService mockNetworkClient;
  late RemoteCurrencyDataSource remoteCurrencyDataSource;
  late String tLatestRatesJson;

  setUp(() {
    mockNetworkClient = MockNetworkClient();
    remoteCurrencyDataSource = RemoteCurrencyDataSourceImpl(
      DioNetworkService(Dio()),
    );

    tLatestRatesJson = fixture('latest_rates.json');
  });

  test(
    'should give CurrencyExchange when called',
    () async {
      when(
        () => mockNetworkClient.get(
          any(),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: json.decode(tLatestRatesJson),
          statusCode: 200,
          requestOptions: RequestOptions(
            path: any(),
            baseUrl: any(),
          ),
        ),
      );
      final result = await remoteCurrencyDataSource.getLatest();
      expect(result, isA<CurrencyExchangesRateModel>());
    },
  );
}
