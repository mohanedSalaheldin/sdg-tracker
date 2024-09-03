import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumbersPadWidget extends StatelessWidget {
  const NumbersPadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      "<-"
    ];
    return SizedBox(
      height: 250.sp,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        padding: const EdgeInsets.all(0),
        crossAxisSpacing: 15.sp,
        mainAxisSpacing: 15.sp,
        crossAxisCount: 3,
        childAspectRatio: 1.9.sp,
        children: List.generate(
          buttons.length,
          (index) => InkWell(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                buttons[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 28.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
