import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/app_colors.dart';
import '../../shared/constants.dart';
import '../widgets/num_pad_and_sawp_widget.dart';
import '../widgets/sawp_calculation_area_widget.dart';

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
