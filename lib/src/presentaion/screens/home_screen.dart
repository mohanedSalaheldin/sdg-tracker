import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sudanese_currency/generated/l10n.dart';
import 'package:sudanese_currency/src/presentaion/widgets/exchange_rate_chart_widget.dart';
import 'package:sudanese_currency/src/shared/app_colors.dart';
import 'package:sudanese_currency/src/shared/constants.dart';

import '../widgets/today_exchange_rate_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: double.infinity),
          const TodayExchangeRateWidget(),
          const Gap(30.0),
          Container(
            // color: Colors.black87,
            child: const LineChartSample2(),
          ),
          const LastTenDaysStstisicsWidget(),
        ],
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      title: const ListTile(
        leading: Icon(Icons.play_circle_fill_outlined),
        title: Text('User Name'),
        subtitle: Text('sub title'),
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
    );
  }
}

class LastTenDaysStstisicsWidget extends StatelessWidget {
  const LastTenDaysStstisicsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: Colors.white,
      ),
      child: const Padding(
        padding: EdgeInsets.all(appDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last 10 Days:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            MonthyStatisticsWidget(),
            MonthyStatisticsWidget(),
            MonthyStatisticsWidget(),
          ],
        ),
      ),
    );
  }
}

class MonthyStatisticsWidget extends StatelessWidget {
  const MonthyStatisticsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.all(0),
      textColor: Colors.black,
      title: Text(
        'Highes Value: ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        '30 Fab',
        style: TextStyle(
          // fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      trailing: Text(
        '52.36',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
