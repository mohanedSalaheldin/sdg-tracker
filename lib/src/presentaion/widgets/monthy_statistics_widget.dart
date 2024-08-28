import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),

        // style: ,
        textColor: Colors.black,
        leading: SizedBox(
          height: 40.0.sp,
          width: 40.0.sp,
          child: Image.asset('assets/images/$iconPath'),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          date,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        trailing: Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
