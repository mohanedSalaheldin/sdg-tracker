import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudanese_currency/generated/l10n.dart';
import 'package:sudanese_currency/src/presentaion/screens/calculator_screen.dart';
import 'package:sudanese_currency/src/presentaion/screens/home_screen.dart';
import 'package:sudanese_currency/src/shared/app_colors.dart';
import 'package:sudanese_currency/src/shared/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'Sudanese Pound',
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(),
        localizationsDelegates: getLocalizationDeledates,
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('en'),
        home: CalculatorScreen(),
      ),
    );
  }

  List<LocalizationsDelegate<dynamic>> get getLocalizationDeledates {
    return const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }
}
