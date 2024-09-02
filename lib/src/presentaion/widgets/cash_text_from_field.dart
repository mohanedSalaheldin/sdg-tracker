import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudanese_currency/src/shared/app_colors.dart';

class CashTextFromField extends StatelessWidget {
  const CashTextFromField({
    super.key, required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.sp,
      child: TextFormField(
        keyboardType: TextInputType.none,
        controller: controller,
        cursorColor: AppColors.greenColor,
        style: TextStyle(
          fontSize: 32.sp,
        ),
        decoration: const InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 46, 47, 45))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.greenColor)),
        ),
      ),
    );
  }
}
