import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:sudanese_currency/src/services/db_services.dart';

import '../models/exchage_rate.dart';

final exchageRatesProvider = FutureProvider<List<ExchageRate>>(
  (ref) async {
    DatabaseServices dbServices = GetIt.instance.get<DatabaseServices>();
    List<ExchageRate> res = await dbServices.getLastTenExchageRate();
    print(res);
    return res;
  },
);
