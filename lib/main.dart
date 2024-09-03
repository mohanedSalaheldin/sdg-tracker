import 'package:flutter/material.dart';
import 'package:sudanese_currency/src/services/db_services.dart';
import 'package:sudanese_currency/src/services/dependancy_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'src/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  await setUpServices();
  runApp(const MyApp());
}
