import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:sudanese_currency/src/shared/app_colors.dart';

class CashTextFromField extends StatelessWidget {
  const CashTextFromField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.sp,
      child: TextFormField(
        keyboardType: TextInputType.none,
        // controller: controller,
        controller: TextEditingController(),
        cursorColor: AppColors.greenColor,
        style: TextStyle(fontSize: 30.sp, color: Colors.white),
        inputFormatters: [
          // TODO: fix formatting issue
          ThousandsFormatter(allowFraction: true),
        ],
        // initialValue: '00',
        decoration: const InputDecoration(
          border: InputBorder.none,

          focusedBorder: InputBorder.none,
          // border: UnderlineInputBorder(
          //     borderSide: BorderSide(color: Color.fromARGB(255, 46, 47, 45))),
          // focusedBorder: UnderlineInputBorder(
          //     borderSide: BorderSide(color: AppColors.greenColor)),
        ),
      ),
    );
  }
}
