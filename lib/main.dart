import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'src/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://nqflgbszfvsqvxochnbh.supabase.co/',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5xZmxnYnN6ZnZzcXZ4b2NobmJoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUyNTExNTcsImV4cCI6MjA0MDgyNzE1N30.WC9SUcsNzZnbWC7NBXqZ3JJMhbLtGN92QmxmDpv17GE',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;
