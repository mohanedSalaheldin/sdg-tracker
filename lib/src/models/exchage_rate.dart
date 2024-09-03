class ExchageRate {
  final int id;
  final DateTime createdAt;
  final double todayExchangeRate;

  ExchageRate({
    required this.id,
    required this.createdAt,
    required this.todayExchangeRate,
  });

  factory ExchageRate.formJson(Map<String, dynamic> json) {
    return ExchageRate(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      todayExchangeRate: json['today_exchage_rate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "created_at": createdAt.toIso8601String(),
      "today_exchage_rate": todayExchangeRate
    };
  }
}
