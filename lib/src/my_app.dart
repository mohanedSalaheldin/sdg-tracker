import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudanese_currency/generated/l10n.dart';
import 'package:sudanese_currency/src/presentation/screens/layout_screen.dart';
import 'package:sudanese_currency/src/shared/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: ProviderScope(
        child: MaterialApp(
          title: 'Sudanese Pound',
          debugShowCheckedModeBanner: false,
          theme: getAppTheme(),
          localizationsDelegates: _getLocalizationDeledates,
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('en'),
          home: const LayoutScreen(),
        ),
      ),
    );
  }

  List<LocalizationsDelegate<dynamic>> get _getLocalizationDeledates {
    return const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }
}
