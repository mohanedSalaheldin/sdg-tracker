import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/calculator_screen_providers.dart';

class NumbersPadWidget extends ConsumerWidget {
  const NumbersPadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputController = ref.watch(inputTxtControllerProvider);
    final outputController = ref.watch(outputTxtControllerProvider);
    final List buttons = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      ".",
      "0",
      "<-"
    ];
    return SizedBox(
      height: 250.sp,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        padding: const EdgeInsets.all(0),
        crossAxisSpacing: 15.sp,
        mainAxisSpacing: 15.sp,
        crossAxisCount: 3,
        childAspectRatio: 1.9.sp,
        children: List.generate(
          buttons.length,
          (index) => InkWell(
            onTap: () {
              if (!_isLastButton(index)) {
                inputController.text = inputController.text + buttons[index];
              } else {
                inputController.text = inputController.text
                    .substring(0, inputController.text.length - 1);
              }
              if (inputController.text.isNotEmpty) {
                outputController.text =
                    (double.parse(inputController.text) / 55)
                        .toStringAsFixed(2);
              } else {
                outputController.text = "";
              }
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: _isLastButton(index)
                  ? _buildBackIcon()
                  : _buildNumerKey(buttons, index),
            ),
          ),
        ),
      ),
    );
  }

  Text _buildNumerKey(List<dynamic> buttons, int index) {
    return Text(
      buttons[index],
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 28.sp,
      ),
    );
  }

  Icon _buildBackIcon() {
    return Icon(
      Icons.arrow_back,
      size: 30.sp,
      color: Colors.black,
    );
  }

  bool _isLastButton(int index) => index == 11;
}
