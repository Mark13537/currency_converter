import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_converter/core/theme/app_theme.dart';
import 'package:currency_converter/features/home/domain/entities/symbol.dart';
import 'package:currency_converter/features/home/presentation/currency_card/currency_card_provider.dart';
import 'package:currency_converter/features/home/presentation/providers/currency_provider.dart';
import 'package:currency_converter/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class CurrencyCard extends StatelessWidget {
  CurrencyCard({
    super.key,
    required this.isRemovable,
  });

  final bool isRemovable;

  final currencyCardProvider = CurrencyCardProvider();
  final currencyProvider = GetIt.I.get<CurrencyProvider>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 6),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: AppTheme.of(context).primary,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey[200]!,
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              width: 110,
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              decoration: BoxDecoration(
                color: AppTheme.of(context).backgroundColor,
                border: Border.all(
                    width: .5, color: AppTheme.of(context).onPrimary),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Observer(
                builder: (context) {
                  return InkWell(
                    onTap: () async {
                      final currency = await Navigator.pushNamed(
                          context, Routes.currencyPage);

                      if (currency != null) {
                        currencyCardProvider.currency =
                            currency as CurrencySymbol;
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CachedNetworkImage(
                          width: 24,
                          imageUrl: currencyCardProvider.currency.flagUrl,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          currencyCardProvider.currency.symbol,
                          style: AppTheme.of(context)
                              .labelMedium
                              .copyWith(fontSize: 13),
                        ),
                        const Icon(Icons.arrow_drop_down_sharp)
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                'Converted Amountt :',
                style: AppTheme.of(context).labelMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Observer(
                builder: (context) {
                  return Text(
                    currencyCardProvider.convertedAmt,
                    style:
                        AppTheme.of(context).labelMedium.copyWith(fontSize: 15),
                  );
                },
              )
            ],
          )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isRemovable)
                  InkWell(
                    onTap: () {
                      currencyProvider.operations.remove(this);
                    },
                    child: const Icon(
                      Icons.cancel,
                      size: 18,
                    ),
                  ),
                TextFormField(
                  textAlign: TextAlign.end,
                  initialValue: '0',
                  style: AppTheme.of(context)
                      .labelLarge
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 21),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    currencyCardProvider.calculateConvertedAmt(value);
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
