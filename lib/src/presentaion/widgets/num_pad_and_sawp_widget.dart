import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudanese_currency/src/presentaion/widgets/numbers_pad_widget.dart';
import 'package:sudanese_currency/src/presentaion/widgets/swap_buttom_widget.dart';
import 'package:sudanese_currency/src/shared/constants.dart';

class NumPadAndSawpWidget extends StatelessWidget {
  const NumPadAndSawpWidget({super.key});

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
