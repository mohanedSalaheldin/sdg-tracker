import 'package:get_it/get_it.dart';
import 'package:sudanese_currency/src/models/exchage_rate.dart';
import 'package:sudanese_currency/src/services/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseServices {
  final _supabase = Supabase.instance.client;
  final NetworkInfo _networkInfo = GetIt.instance.get<NetworkInfo>();

  Future<List<ExchageRate>> getLastTenExchageRate() async {
    if (await _networkInfo.isConnected) {
      try {
        return await _fetchLastTenExchngeRatesAndParseThemIntoModels();
      } catch (e) {
        throw Exception('Failed to fetch data: $e');
      }
    } else {
      throw Exception('Not Internet Connection');
    }
  }

  Future<List<ExchageRate>>
      _fetchLastTenExchngeRatesAndParseThemIntoModels() async {
    final response = await _fetchLastTenExchngeRates();
    return _parseIntoModels(response);
  }

  List<ExchageRate> _parseIntoModels(PostgrestList response) {
    List<ExchageRate> models = [];
    for (var element in response) {
      models.add(ExchageRate.formJson(element));
    }
    return models;
  }

  Future<PostgrestList> _fetchLastTenExchngeRates() async {
    return await _supabase
        .from('exchage_rates')
        .select()
        .order('created_at', ascending: false)
        .limit(10);
  }
}

/// Initialize the current supabase instance
Future<Supabase> initializeDatabase() {
  return Supabase.initialize(
    url: 'https://nqflgbszfvsqvxochnbh.supabase.co/',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5xZmxnYnN6ZnZzcXZ4b2NobmJoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUyNTExNTcsImV4cCI6MjA0MDgyNzE1N30.WC9SUcsNzZnbWC7NBXqZ3JJMhbLtGN92QmxmDpv17GE',
  );
}
