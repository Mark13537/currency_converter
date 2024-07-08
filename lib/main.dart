import 'package:currency_converter/core/di/di.dart';
import 'package:currency_converter/features/home/presentation/views/home_page.dart';
import 'package:currency_converter/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DI.initModules();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 915),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          onGenerateRoute: AppNavigator.onGeneratedRoute,
          home: HomePage(),
        );
      },
    );
  }
}
