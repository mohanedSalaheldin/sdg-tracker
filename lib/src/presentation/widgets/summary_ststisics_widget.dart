import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudanese_currency/src/shared/constants.dart';
import 'monthy_statistics_widget.dart';

class SummaryStstisicsWidget extends StatelessWidget {
  const SummaryStstisicsWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            const MonthyStatisticsWidget(
              title: 'Higher',
              iconPath: 'higher.png',
              value: '55.639',
              date: '21/08',
            ),
            const MonthyStatisticsWidget(
              title: 'Avarage',
              iconPath: 'avg.png',
              value: '55.639',
              date: '----',
            ),
            const MonthyStatisticsWidget(
              title: 'Lower',
              iconPath: 'lower.png',
              value: '52.985',
              date: '28/08',
            ),
          ],
        ),
      ),
    );
  }
}
