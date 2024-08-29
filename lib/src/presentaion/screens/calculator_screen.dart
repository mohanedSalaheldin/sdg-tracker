import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudanese_currency/src/shared/app_colors.dart';
import 'package:sudanese_currency/src/shared/constants.dart';
import 'package:sudanese_currency/src/shared/screen_sizes.dart';

import '../widgets/numbers_pad_widget.dart';
import '../widgets/swap_buttom_widget.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const SizedBox(width: double.infinity),
            const SawpCalculationAreaWidget(),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(appDefaultPadding),
                height: 1.sp,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: AppColors.grayBackgroundColor,
                ),
                child: const Center(child: Text('Database')),
              ),
            ),
            // const SizedBox(height: ),
            const NumPadAndSawpWidget(),
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

class SawpCalculationAreaWidget extends StatelessWidget {
  const SawpCalculationAreaWidget({
    super.key,
  });

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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('SDG'), Text('EGP')],
              ),
              SizedBox(
                height: 90.sp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120.sp,
                      child: TextFormField(
                        keyboardType: TextInputType.none,
                        controller: TextEditingController(),
                        cursorColor: AppColors.greenColor,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.greenColor)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40.sp,
                      height: 40.sp,
                      child: MaterialButton(
                        padding: const EdgeInsets.all(0),
                        color: const Color.fromARGB(255, 52, 52, 52),
                        onPressed: () {},
                        child: const Icon(
                          Icons.swap_calls_sharp,
                          // size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120.sp,
                      child: TextFormField(
                        keyboardType: TextInputType.none,
                        controller: TextEditingController(),
                        cursorColor: AppColors.greenColor,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.greenColor)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 2.0,
                    width: context.screenWidth,
                    color: Colors.amber,
                    // child: const Text('hhI'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NumPadAndSawpWidget extends StatelessWidget {
  const NumPadAndSawpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            const NumbersPadWidget(),
            SizedBox(height: 10.0.sp),
            const SwapButtomWidget(),
          ],
        ),
      ),
    );
  }
}
