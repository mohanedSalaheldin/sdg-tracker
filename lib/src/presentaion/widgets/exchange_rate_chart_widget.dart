import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sudanese_currency/src/shared/constants.dart';

import '../../shared/app_colors.dart';

class LastDaysLineChartWidget extends StatefulWidget {
  const LastDaysLineChartWidget({super.key});

  @override
  State<LastDaysLineChartWidget> createState() =>
      _LastDaysLineChartWidgetState();
}

class _LastDaysLineChartWidgetState extends State<LastDaysLineChartWidget> {
  List<Color> gradientColors = [
    // Colors.cyan,
    // Colors.red
    AppColors.greenColor,
    AppColors.greenColorTranspernt,
    AppColors.greenColorTranspernt,
    Colors.transparent
    // AppColors.contentColorBlue,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appDefaultPadding),
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.40,
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
    const style = TextStyle(
      // fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = const Text('20', style: style);
        break;
      case 1:
        text = const Text('21', style: style);
        break;
      case 2:
        text = const Text('22', style: style);
        break;
      case 3:
        text = const Text('23', style: style);
        break;
      case 4:
        text = const Text('24', style: style);
        break;
      case 5:
        text = const Text('25', style: style);
        break;
      case 6:
        text = const Text('26', style: style);
        break;
      case 7:
        text = const Text('27', style: style);
        break;
      case 8:
        text = const Text('28', style: style);
        break;
      case 9:
        text = const Text('29', style: style);
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
      case 55:
        text = '55';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  /// used to return LineChartData that contain exact data
  LineChartData mainData() {
    var flLinesColor = const Color.fromARGB(255, 59, 59, 59);
    const spots = [
      FlSpot(0, 54.71),
      FlSpot(1, 53.08),
      FlSpot(2, 53.12),
      FlSpot(3, 54.79),
      FlSpot(4, 54.4),
      FlSpot(5, 52.62),
      FlSpot(6, 53.87),
      FlSpot(7, 51.23),
      FlSpot(8, 53.37),
      FlSpot(9, 52.42)
    ];
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
            showTitles: true,
            // interval: 1,
            getTitlesWidget: leftTitleWidgets,

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

        //  Border.(),
      ),
      minX: 0,
      maxX: 9,
      minY: 50,
      maxY: 57,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: AppColors.greenColor,
          // gradient: LinearGradient(
          //   colors: gradientColors,
          // ),
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
