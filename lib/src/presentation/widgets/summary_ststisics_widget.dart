import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudanese_currency/src/providers/exchange_rates_provider.dart';
import 'package:sudanese_currency/src/shared/constants.dart';
import 'monthy_statistics_widget.dart';

class SummaryStatisicsWidget extends ConsumerWidget {
  const SummaryStatisicsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statisticProvider = ref.watch(summaryStatisicsProvider);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(appDefaultradius),
          topRight: Radius.circular(appDefaultradius),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(appDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last 10 Days:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
                color: Colors.black,
              ),
            ),
            MonthyStatisticsWidget(
              title: 'Higher',
              iconPath: 'higher.png',
              value: statisticProvider.higher.todayExchangeRate.toString(),
              date: statisticProvider.higher.createdAt.toString(),
            ),
            MonthyStatisticsWidget(
              title: 'Avarage',
              iconPath: 'avg.png',
              value: statisticProvider.avg,
              date: '----',
            ),
            MonthyStatisticsWidget(
              title: 'Lower',
              iconPath: 'lower.png',
              value: statisticProvider.lower.todayExchangeRate.toString(),
              date: statisticProvider.lower.createdAt.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
