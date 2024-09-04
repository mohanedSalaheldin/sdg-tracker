import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sudanese_currency/src/models/exchage_rate.dart';
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
        bottomNavigationBar: bottomNavBar(ref),
        body: exRatesProvider.when(
          data: (data) => screens[currentLayout],
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(
              child: CircularProgressIndicator(
            color: AppColors.greenColor,
          )),
        ));
  }

  BottomNavigationBar bottomNavBar(WidgetRef ref) {
    return BottomNavigationBar(
      onTap: (value) {
        ref.watch(layoutScreenProvider.notifier).chageScreen(value);
      },
      iconSize: 30,
      currentIndex: ref.watch(layoutScreenProvider),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Iconsax.home_trend_up_copy), label: 'To'),
        BottomNavigationBarItem(
            icon: Icon(Iconsax.money_change_copy), label: 'Tan 2'),
        BottomNavigationBarItem(
            icon: Icon(Iconsax.arrange_square_copy), label: 'Tan 2'),
      ],
    );
  }
}
