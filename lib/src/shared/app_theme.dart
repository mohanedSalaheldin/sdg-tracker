import 'package:flutter/material.dart';
import 'package:sudanese_currency/src/shared/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      fontFamily: "BalooBhaijaan2",
      scaffoldBackgroundColor: AppColors.blackBackgroundColor,
      appBarTheme: const AppBarTheme(
        color: AppColors.blackBackgroundColor,
      ),
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Color.fromARGB(255, 64, 64, 64),
      ));
}
