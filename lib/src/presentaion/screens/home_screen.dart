import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sudanese_currency/generated/l10n.dart';
import 'package:sudanese_currency/src/shared/app_colors.dart';
import 'package:sudanese_currency/src/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          leading: Icon(Icons.play_circle_fill_outlined),
          title: Text(
            'User Name',
          ),
          subtitle: Text(
            'sub title',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_today),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(appDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            Text(
              'Exchange rate',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.grey),
            ),
            const Text(
              '\$4,285.08',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
            const Gap(5.0),
            Container(
              // width: 0,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.presentBackgroundColor,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_upward,
                      size: 17, color: AppColors.greenColor),
                  Text(
                    '-0.090',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.greenColor, fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
