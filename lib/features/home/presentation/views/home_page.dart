import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_converter/core/theme/app_theme.dart';
import 'package:currency_converter/features/home/domain/entities/symbol.dart';
import 'package:currency_converter/features/home/presentation/currency_card/currency_card.dart';
import 'package:currency_converter/features/home/presentation/providers/currency_provider.dart';
import 'package:currency_converter/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currencyProvider = GetIt.I.get<CurrencyProvider>();

  @override
  void initState() {
    super.initState();
    currencyProvider.addCard();

    currencyProvider.getCurrencySymbols();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).backgroundColor,
      appBar: getAppBar(context),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  currencyProvider.operations[index],
                ],
              );
            },
            itemCount: currencyProvider.operations.length,
          );
        },
      ),
      floatingActionButton: BottomBar(currencyProvider: currencyProvider),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppTheme.of(context).backgroundColor,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 10.w),
          Text(
            'Currency Converter',
            style: AppTheme.of(context)
                .labelLarge
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      elevation: 0,
      actions: [
        GestureDetector(
          onTap: () {
            currencyProvider.operations.add(CurrencyCard(isRemovable: true));
          },
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: AppTheme.of(context).onPrimary,
              ),
              Text(
                'Add',
                style: AppTheme.of(context).labelLarge,
              ),
              SizedBox(
                width: 10.w,
              )
            ],
          ),
        )
      ],
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.currencyProvider,
  });

  final CurrencyProvider currencyProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          decoration: BoxDecoration(
            color: AppTheme.of(context).backgroundColor,
            border:
                Border.all(width: .45.w, color: AppTheme.of(context).onPrimary),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Observer(
                builder: (context) {
                  return InkWell(
                    onTap: () async {
                      final currency = await Navigator.pushNamed(
                          context, Routes.currencyPage);

                      if (currency != null) {
                        currencyProvider.opCurrency =
                            currency as CurrencySymbol;
                        currencyProvider.updateCurrentExchangeRates();
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Base Currency',
                          style: AppTheme.of(context)
                              .labelLarge
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CachedNetworkImage(
                              width: 24,
                              imageUrl: currencyProvider.opCurrency.flagUrl,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              currencyProvider.opCurrency.symbol,
                              style: AppTheme.of(context)
                                  .labelLarge
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Icon(Icons.arrow_drop_down_sharp)
                          ],
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Container(
                          width: 2.w,
                          height: 24.h,
                          color: AppTheme.of(context).onPrimary,
                        )
                      ],
                    ),
                  );
                },
              ),
              Observer(
                builder: (context) {
                  return Text(
                    currencyProvider.opResult,
                    style: AppTheme.of(context).labelLarge.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  );
                },
              )
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            SizedBox(width: 12.w),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  List<String> operations = [];
                  for (int i = 0; i < currencyProvider.operations.length; i++) {
                    CurrencyCard obj =
                        currencyProvider.operations[i] as CurrencyCard;
                    operations.add(obj.currencyCardProvider.convertedAmt);
                  }
                  currencyProvider.calculateResult(operations: operations);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    padding: const EdgeInsets.all(0.0),
                    backgroundColor: Colors.amberAccent,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width.w - 20, 45),
                    elevation: 7),
                child: Text(
                  'Calculate',
                  style: AppTheme.of(context).labelLarge,
                ),
              ),
            ),
            SizedBox(width: 12.w),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
