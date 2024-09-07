import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:sudanese_currency/src/providers/helper_classes/helper_classes.dart';
import 'package:sudanese_currency/src/services/db_services.dart';

import '../models/exchage_rate.dart';

final exchageRatesProvider = FutureProvider<List<ExchageRate>>(
  (ref) async {
    DatabaseServices dbServices = GetIt.instance.get<DatabaseServices>();
    List<ExchageRate> res = await dbServices.getLastTenExchageRate();
    res.sort((a, b) => a.createdAt.compareTo(b.createdAt));

    //------------------------------------------------------------------
    for (var element in res) {
      print(element.toJson());
    }

    /******************************************************************************* */
    return res;
  },
);

final flSpotProvider = Provider<List<FlSpot>>((ref) {
  final rates = ref.watch(exchageRatesProvider);
  List<FlSpot> spots = [];
  rates.when(
    data: (data) {
      for (var i = 0; i < data.length; i++) {
        spots.add(FlSpot(i.toDouble(), data[i].todayExchangeRate));
      }
    },
    error: (error, stackTrace) {},
    loading: () {},
  );
  return spots;
});

final titleDataProvider = Provider<TitleData>((ref) {
  final rates = ref.watch(exchageRatesProvider);
  TitleData titleData = TitleData(exchangeRate: 0, increaseRate: '0');
  rates.when(
      data: (data) {
        titleData = _caculateTitlteValues(data);
      },
      error: (error, stackTrace) {},
      loading: () {});
  return titleData;
});

TitleData _caculateTitlteValues(List<ExchageRate> data) {
  int lastDatIndex = data.length - 1;
  double increaseRate = data[lastDatIndex].todayExchangeRate -
      data[lastDatIndex - 1].todayExchangeRate;
  double exchangeRate = data.last.todayExchangeRate;
  return TitleData(
      exchangeRate: exchangeRate,
      increaseRate: increaseRate.toStringAsFixed(3));
}

final summaryStatisicsProvider = Provider<SummaryStatisics>((ref) {
  final rates = ref.watch(exchageRatesProvider);

  ExchageRate emptyObject =
      ExchageRate(id: -1, createdAt: DateTime.now(), todayExchangeRate: 0);
  SummaryStatisics statisics =
      SummaryStatisics(avg: '0', higher: emptyObject, lower: emptyObject);

  rates.when(
      data: (ratesData) {
        ratesData
            .sort((a, b) => b.todayExchangeRate.compareTo(a.todayExchangeRate));

        statisics = SummaryStatisics(
            avg: _calcAvg(ratesData),
            higher: ratesData.first,
            lower: ratesData.last);
      },
      error: (error, stackTrace) {},
      loading: () {});
  return statisics;
});

String _calcAvg(List<ExchageRate> ratesData) =>
    ((ratesData.first.todayExchangeRate + ratesData.last.todayExchangeRate) / 2)
        .toString();
final datesProvider = Provider<List<String>>((ref) {
  final rates = ref.watch(exchageRatesProvider);
  List<String> dates = [];
  rates.when(
      data: (data) {
        for (var i = 0; i < data.length; i++) {
          dates.add(data[i].createdAt.day.toString());
        }
      },
      error: (error, stackTrace) {},
      loading: () {});
  return dates;
});

final dateListProvider = Provider<List<String>>((ref) {
  final rates = ref.watch(exchageRatesProvider);
  List<String> dates = [];
  rates.when(
      data: (data) {
        for (var i = 0; i < data.length; i++) {
          dates.add(data[i].createdAt.day.toString());
        }
      },
      error: (error, stackTrace) {},
      loading: () {});
  return dates;
});
