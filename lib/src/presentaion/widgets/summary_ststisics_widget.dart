import 'package:flutter/material.dart';
import 'package:sudanese_currency/src/presentaion/screens/home_screen.dart';
import 'package:sudanese_currency/src/shared/constants.dart';

class SummaryStstisicsWidget extends StatelessWidget {
  const SummaryStstisicsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
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
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            MonthyStatisticsWidget(
              title: 'Higher',
              iconPath: 'higher.png',
              value: '55.639',
              date: '21/08',
            ),
            MonthyStatisticsWidget(
              title: 'Avarage',
              iconPath: 'avg.png',
              value: '55.639',
              date: '----',
            ),
            MonthyStatisticsWidget(
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


class MonthyStatisticsWidget extends StatelessWidget {
  const MonthyStatisticsWidget({
    super.key,
    required this.title,
    required this.iconPath,
    required this.value,
    required this.date,
  });
  final String title;
  final String iconPath;
  final String value;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        textColor: Colors.black,
        leading: SizedBox(
          height: 45.0,
          width: 45.0,
          child: Image.asset('assets/images/$iconPath'),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        trailing: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}