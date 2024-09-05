import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sudanese_currency/src/presentation/widgets/cash_text_from_field.dart';
import 'package:sudanese_currency/src/shared/app_colors.dart';
import 'package:sudanese_currency/src/shared/constants.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({super.key});

  @override
  State<DataEntryScreen> createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  
  final TextEditingController firstValueCtrl = TextEditingController();
  final TextEditingController secondValueCtrl = TextEditingController();

  @override
  void dispose() {
    firstValueCtrl.dispose();
    secondValueCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayBackgroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CashTextFromField(controller: firstValueCtrl),
            const SizedBox(
              height: 20,
            ),
            CashTextFromField(controller: secondValueCtrl),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: appDefaultradius.sp,
              ),
              height: 55.sp,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(appDefaultradius / 2)),
              ),
              clipBehavior: Clip.antiAlias,
              child: MaterialButton(
                color: Colors.black,
                onPressed: () async {
                  double firsVal = double.parse(firstValueCtrl.text);
                  double secondVal = double.parse(secondValueCtrl.text);
                  double res = (firsVal + secondVal) / 2;
                  // final response = await supabase.from('exchage_rates').insert([
                  //   {'today_exchage_rate': res.toDouble()}
                  // ]);
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
