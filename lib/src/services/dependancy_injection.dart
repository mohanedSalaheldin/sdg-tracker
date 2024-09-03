import 'package:get_it/get_it.dart';
import 'package:sudanese_currency/src/services/db_services.dart';

import 'network_info.dart';

/// /// Set up and register the necessary service dependencies for the app.
Future<void> setUpServices() async {
  GetIt.instance.registerSingleton<NetworkInfo>(NetworkInfoImpl());
  GetIt.instance.registerSingleton<DatabaseServices>(DatabaseServices());
}
