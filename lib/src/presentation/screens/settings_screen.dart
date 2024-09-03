import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          
         
          //
          // Future.delayed(
          //   const Duration(seconds: 0),
          //   () {},
          // );

          // print(models.length);
          // for (int i = 0; i < 10; i++) {
          //   await supabase.from('exchage_rates').insert([
          //     {
          //       'today_exchage_rate': prices[i].toString(),
          //       'created_at':
          //           DateTime.now().subtract(Duration(days: i)).toString(),
          //     }
          //   ]);
          // }
        },
      ),
    );
  }
}
