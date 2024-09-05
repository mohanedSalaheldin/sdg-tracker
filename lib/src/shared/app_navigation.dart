import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
