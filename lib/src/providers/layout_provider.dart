import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudanese_currency/src/presentaion/screens/calculator_screen.dart';
import 'package:sudanese_currency/src/presentaion/screens/home_screen.dart';
import 'package:sudanese_currency/src/presentaion/screens/settings_screen.dart';

class LayoutProvider extends StateNotifier<int> {
  LayoutProvider() : super(0);

  void chageScreen(int newIndex) {
    state = newIndex;
  }
}

final layoutScreenProvider = StateNotifierProvider<LayoutProvider, int>(
  (ref) => LayoutProvider(),
);

List<Widget> screens = [
  const HomeScreen(),
  const CalculatorScreen(),
  const SettingsScreen()
];


