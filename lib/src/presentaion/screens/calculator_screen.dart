import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudanese_currency/src/shared/constants.dart';
import 'package:sudanese_currency/src/shared/screen_sizes.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final List buttons = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    ".",
    "0",
    "<-",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: double.infinity),
            Container(
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
                    Container(
                      color: Colors.amberAccent,
                      // width: double.infinity,
                      height: context.screenWidth / 1.1.sp,
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(0),
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 3,
                        childAspectRatio: 1.7,
                        children: List.generate(
                          buttons.length,
                          (index) => ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              buttons[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
