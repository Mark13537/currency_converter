import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_converter/core/theme/app_theme.dart';
import 'package:currency_converter/features/home/domain/entities/symbol.dart';
import 'package:currency_converter/features/home/presentation/providers/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class CurrencyPicker extends StatelessWidget {
  CurrencyPicker({super.key});

  final currencyProvider = GetIt.I.get<CurrencyProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.chevron_left,
            size: 24,
            color: AppTheme.of(context).onPrimary,
          ),
        ),
        iconTheme: IconThemeData(color: AppTheme.of(context).onPrimary),
        backgroundColor: AppTheme.of(context).primary,
        title: Text(
          'Select Currency',
          style: AppTheme.of(context).labelLarge,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final currency = currencyProvider.allCurrencys[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: .5.w,
                      color: AppTheme.of(context).secondary,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.only(top: 8, left: 20, right: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.pop<CurrencySymbol>(context, currency);
                    },
                    leading: SizedBox(
                      width: 50.w,
                      child: Align(
                        alignment: Alignment.center,
                        child: CachedNetworkImage(
                          imageUrl: currency.flagUrl,
                          errorWidget: (context, url, error) => Icon(
                            Icons.flag,
                            size: 40.r,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      currency.symbol,
                      style: AppTheme.of(context)
                          .labelLarge
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      currency.name,
                      style: AppTheme.of(context).labelMedium,
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                    ),
                  ),
                );
              },
              itemCount: currencyProvider.allCurrencys.length,
            ),
          )
        ],
      ),
    );
  }
}
