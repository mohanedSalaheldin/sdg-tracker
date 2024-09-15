import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudanese_currency/src/providers/exchange_rates_provider.dart';

final inputTxtControllerProvider = Provider<TextEditingController>((ref) {
  
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose());
  return controller;
});

final outputTxtControllerProvider = Provider<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose()) ;
  return controller;
});

final isSwapFromSudanesePoundProvider = StateProvider(
  (ref) => true,
);

class SwapCalculationsNotifier extends StateNotifier<bool> {
  final Ref ref; // Ref object to read other providers

  SwapCalculationsNotifier(this.ref) : super(true);

  void calculateOutput(bool isSwapFromSudanese) {
    _caclSwappingOutput(isSwapFromSudanese);
  }

  void _caclSwappingOutput(bool isSwapFromSudanese) {
    final inputController = ref.watch(inputTxtControllerProvider);
    final outputController = ref.watch(outputTxtControllerProvider);
    final titledata = ref.watch(titleDataProvider);
    double userInput = double.parse(inputController.text);
    double todayExchangeRate = titledata.exchangeRate;

    
    if (isSwapFromSudanese) {
      outputController.text =
          (userInput / todayExchangeRate).toStringAsFixed(2);
    } else {
      outputController.text =
          (userInput * todayExchangeRate).toStringAsFixed(2);
    }
  }
}

final swapCalculationProvider =
    StateNotifierProvider<SwapCalculationsNotifier, bool>((ref) {
  return SwapCalculationsNotifier(ref);
});
