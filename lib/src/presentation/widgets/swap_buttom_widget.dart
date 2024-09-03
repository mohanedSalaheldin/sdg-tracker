import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudanese_currency/src/shared/constants.dart';

class SwapButtomWidget extends StatelessWidget {
  const SwapButtomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: appDefaultradius.sp,
      ),
      height: 55.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(appDefaultradius / 2)),
      ),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        color: Colors.black,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Swap',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(width: 5.0.sp),
            const Icon(Icons.arrow_outward, size: 15)
          ],
        ),
      ),
    );
  }
}
