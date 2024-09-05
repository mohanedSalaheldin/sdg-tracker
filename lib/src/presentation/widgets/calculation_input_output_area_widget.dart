import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudanese_currency/src/providers/calculator_screen_providers.dart';
import 'package:sudanese_currency/src/shared/app_colors.dart';
import 'package:sudanese_currency/src/shared/constants.dart';

import 'cash_text_from_field.dart';

class CalculationInputOutputWidget extends ConsumerWidget {
  const CalculationInputOutputWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputController = ref.watch(inputTxtControllerProvider);
    final outputController = ref.watch(outputTxtControllerProvider);
    var textStyle = TextStyle(fontSize: 25.sp, height: 1.0);
    return Expanded(
      flex: 5,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(appDefaultPadding),
        height: 180.sp,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: AppColors.grayBackgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(appDefaultPadding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('SDG', style: textStyle),
                  Text('EGP', style: textStyle),
                ],
              ),
              SizedBox(
                height: 90.sp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CashTextFromField(controller: inputController),
                    SizedBox(
                      width: 42.sp,
                      height: 42.sp,
                      child: MaterialButton(
                        padding: const EdgeInsets.all(0),
                        color: const Color.fromARGB(255, 52, 52, 52),
                        onPressed: () {},
                        child: const Icon(Icons.swap_horiz_outlined),
                      ),
                    ),
                    CashTextFromField(controller: outputController),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
