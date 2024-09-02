import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudanese_currency/src/shared/app_colors.dart';
import 'package:sudanese_currency/src/shared/constants.dart';
import 'package:sudanese_currency/src/shared/screen_sizes.dart';

import 'cash_text_from_field.dart';

class SawpCalculationAreaWidget extends StatefulWidget {
  const SawpCalculationAreaWidget({
    super.key,
  });

  @override
  State<SawpCalculationAreaWidget> createState() =>
      _SawpCalculationAreaWidgetState();
}

class _SawpCalculationAreaWidgetState extends State<SawpCalculationAreaWidget> {
  late TextEditingController inputController;
  late TextEditingController outputController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputController = TextEditingController();
    outputController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    inputController.dispose();
    outputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    'SDG',
                    style: TextStyle(fontSize: 25.sp, height: 1.0),
                  ),
                  Text(
                    'EGP',
                    style: TextStyle(fontSize: 25.sp, height: 1.0),
                  ),
                  // Text(
                  //   'EGP',
                  //   style: TextStyle(
                  //     fontSize: 25.sp,
                  //   ),
                  // ),
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
                        child: const Icon(
                          Icons.swap_horiz_outlined,
                          // size: 20,
                        ),
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
