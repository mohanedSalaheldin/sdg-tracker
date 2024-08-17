import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sudanese_currency/generated/l10n.dart';
import 'package:sudanese_currency/src/presentaion/screens/home_screen.dart';
import 'package:sudanese_currency/src/shared/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudanese Pound',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "BalooBhaijaan2",
        scaffoldBackgroundColor: AppColors.blackBackgroundColor,
        appBarTheme: const AppBarTheme(
          color: AppColors.blackBackgroundColor,
        ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('en'),
      home: const HomeScreen(),
    );
  }
}
