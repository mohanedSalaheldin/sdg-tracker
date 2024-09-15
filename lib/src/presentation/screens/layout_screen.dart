import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sudanese_currency/src/providers/exchange_rates_provider.dart';
import 'package:sudanese_currency/src/providers/layout_provider.dart';
import 'package:sudanese_currency/src/shared/app_colors.dart';

class LayoutScreen extends ConsumerWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLayout = ref.watch(layoutScreenProvider);
    final exRatesProvider = ref.watch(exchageRatesProvider);
    return Scaffold(
        bottomNavigationBar: bottomNavBar(ref, context),
        body: exRatesProvider.when(
          data: (data) => screens[currentLayout],
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(
              child: CircularProgressIndicator(
            color: AppColors.greenColor,
          )),
        ));
  }

  BottomNavigationBar bottomNavBar(WidgetRef ref, BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
      ),
      onTap: (value) {
        // if (value == 1) {
        //   context.push(const CalculatorScreen());
        // } else {
        //   if (value == 2) {
        //     context.push(const SettingsScreen());
        //   }
        // }
        ref.watch(layoutScreenProvider.notifier).chageScreen(value);
      },
      iconSize: 30,
      // currentIndex: 0,
      currentIndex: ref.watch(layoutScreenProvider),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Iconsax.home_trend_up_copy),
          activeIcon: Icon(Iconsax.home_trend_up),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Icon(Iconsax.calculator_copy),
            activeIcon: Icon(Iconsax.calculator),
            label: 'Calculator'),
        BottomNavigationBarItem(
            icon: Icon(Iconsax.setting_2_copy),
            activeIcon: Icon(Iconsax.setting_2),
            label: 'Settings'),
      ],
    );
  }
}
