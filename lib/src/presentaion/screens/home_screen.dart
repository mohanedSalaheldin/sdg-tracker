import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../widgets/exchange_rate_chart_widget.dart';
import '../widgets/summary_ststisics_widget.dart';
import '../widgets/today_exchange_rate_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: appbar(),
        
        // backgroundColor: const Color(0xff101014),2.0
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: double.infinity),
            TodayExchangeRateWidget(),
            LastDaysLineChartWidget(),
            SummaryStstisicsWidget(),
          ],
        ),
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
