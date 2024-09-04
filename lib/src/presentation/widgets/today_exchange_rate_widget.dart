import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sudanese_currency/src/providers/exchange_rates_provider.dart';
import 'package:sudanese_currency/src/shared/app_colors.dart';
import 'package:sudanese_currency/src/shared/constants.dart';

class TodayExchangeRateWidget extends ConsumerWidget {
  const TodayExchangeRateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleData = ref.watch(titleDataProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exchange rate',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey),
          ),
          Text(
            '\$${titleData.exchangeRate}',
            style: TextStyle(fontSize: 32.0.sp, color: Colors.white),
          ),
          const Gap(5.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.presentBackgroundColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isPositive(titleData.increaseRate)
                      ? Icons.arrow_upward
                      : Icons.arrow_downward,
                  size: 17,
                  color: isPositive(titleData.increaseRate)
                      ? AppColors.greenColor
                      : Colors.redAccent,
                ),
                Text(
                  titleData.increaseRate,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: isPositive(titleData.increaseRate)
                          ? AppColors.greenColor
                          : Colors.redAccent,
                      fontSize: 14.sp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  bool isPositive(String rate) {
    return (double.parse(rate) >= 0);
  }
}
