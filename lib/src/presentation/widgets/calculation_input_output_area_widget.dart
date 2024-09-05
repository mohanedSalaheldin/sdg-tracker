import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
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
    var textStyle =
        TextStyle(fontSize: 22.sp, height: 1.0, color: Colors.white);
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CashTextFromField(controller: inputController),
                        Container(
                          width: 50.sp,
                          height: 50.sp,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: MaterialButton(
                            padding: const EdgeInsets.all(0),
                            color: const Color.fromARGB(255, 52, 52, 52),
                            onPressed: () {},
                            child:
                                const Icon(Iconsax.arrow_swap_horizontal_copy),
                          ),
                        ),
                        CashTextFromField(controller: outputController),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 155.sp,
                          child: const Divider(
                            height: 10,
                            color: Colors.green,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(
                          width: 155.sp,
                          child: const Divider(
                            height: 10,
                            color: Colors.transparent,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
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
