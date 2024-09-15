import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudanese_currency/src/presentation/widgets/numbers_pad_widget.dart';
import 'package:sudanese_currency/src/shared/constants.dart';
import '../../providers/calculator_screen_providers.dart';

class NumPadAndSawpWidget extends ConsumerWidget {
  const NumPadAndSawpWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputController = ref.watch(inputTxtControllerProvider);
    final outputController = ref.watch(outputTxtControllerProvider);
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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NumbersPadWidget(),
            // SizedBox(height: 5.0.sp),
            // SwapButtomWidget(
            //   onPressed: () {
            //     outputController.text = "Edited";
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
