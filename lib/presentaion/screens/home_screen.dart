import 'package:flutter/material.dart';
import 'package:sudanese_currency/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).title,
          style: const TextStyle(color: Colors.amber),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(width: double.infinity),
          Text(
            S.of(context).title,
            style: const TextStyle(color: Colors.amber),
          ),
        ],
      ),
    );
  }
}
