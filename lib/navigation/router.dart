import 'package:currency_converter/features/home/presentation/views/currency_picker.dart';
import 'package:currency_converter/features/home/presentation/views/home_page.dart';
import 'package:currency_converter/navigation/routes.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
          settings: settings,
        );

      case Routes.currencyPage:
        return MaterialPageRoute(
          builder: (context) => CurrencyPicker(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
          settings: settings,
        );
    }
  }
}
