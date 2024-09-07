import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudanese_currency/src/shared/constants.dart';

import '../../providers/exchange_rates_provider.dart';
import '../../shared/app_colors.dart';

class LastDaysLineChartWidget extends ConsumerStatefulWidget {
  const LastDaysLineChartWidget({super.key});

  @override
  ConsumerState<LastDaysLineChartWidget> createState() =>
      _LastDaysLineChartWidgetState();
}

class _LastDaysLineChartWidgetState
    extends ConsumerState<LastDaysLineChartWidget> {
  List<Color> gradientColors = [
    AppColors.greenColor,
    AppColors.greenColorTranspernt,
    AppColors.greenColorTranspernt,
    Colors.transparent
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appDefaultPadding),
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.50.sp,
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 0, left: 0, top: 30, bottom: 0),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final dateList = ref.watch(dateListProvider);
    const style = TextStyle(fontSize: 12);
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = Text(dateList[9], style: style);
        break;
      case 1:
        text = Text(dateList[8], style: style);
        break;
      case 2:
        text = Text(dateList[7], style: style);
        break;
      case 3:
        text = Text(dateList[6], style: style);
        break;
      case 4:
        text = Text(dateList[5], style: style);
        break;
      case 5:
        text = Text(dateList[4], style: style);
        break;
      case 6:
        text = Text(dateList[3], style: style);
        break;
      case 7:
        text = Text(dateList[2], style: style);
        break;
      case 8:
        text = Text(dateList[1], style: style);
        break;
      case 9:
        text = Text(dateList[0], style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      // fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch ((value).toInt()) {
      case 50:
        text = '50';
        break;
      case 51:
        text = '51';
        break;
      case 52:
        text = '52';
        break;
      case 53:
        text = '53';
        break;
      case 54:
        text = '54';
        break;
      case 56:
        text = '56';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    final spots = ref.watch(flSpotProvider);
    final statisticProvider = ref.watch(summaryStatisicsProvider);
    return LineChartData(
      lineTouchData: const LineTouchData(
        longPressDuration: Duration(milliseconds: 100),
        touchTooltipData: LineTouchTooltipData(),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 2,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.blackBackgroundColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.blackBackgroundColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            interval: 1,
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text(value.toInt().toString(),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left);
            },
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          left: BorderSide(color: Color.fromARGB(255, 39, 41, 42)),
          bottom: BorderSide(color: Color.fromARGB(255, 39, 41, 42)),
        ),
      ),
      minX: 0,
      maxX: 9,
      minY: (statisticProvider.lower.todayExchangeRate).toInt() - 1,
      maxY: (statisticProvider.higher.todayExchangeRate).toInt() + 1,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: AppColors.greenColor,
          barWidth: 1.5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
