import 'package:sudanese_currency/src/models/exchage_rate.dart';

class TitleData {
  final double exchangeRate;
  final String increaseRate;

  TitleData({required this.exchangeRate, required this.increaseRate});
}

class SummaryStatisics {
  final String avg;
  final ExchageRate higher;
  final ExchageRate lower;

  SummaryStatisics(
      {required this.avg, required this.higher, required this.lower});
}