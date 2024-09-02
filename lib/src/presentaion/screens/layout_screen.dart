import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sudanese_currency/src/providers/layout_provider.dart';

class LayoutScreen extends ConsumerWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLayout = ref.watch(layoutScreenProvider);
    return Scaffold(
      bottomNavigationBar: bottomNavBar(ref),
      body: screens[currentLayout],
    );
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
            icon: Icon(
              Iconsax.home_trend_up_copy,
              // color: Colors.black,
            ),
            label: 'To'),
        BottomNavigationBarItem(
            icon: Icon(
              Iconsax.money_change_copy,
            ),
            label: 'Tan 2'),
        BottomNavigationBarItem(
            icon: Icon(
              Iconsax.arrange_square_copy,
            ),
            label: 'Tan 2'),
      ],
    );
  }
}
