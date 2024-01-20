import 'dart:convert';

class CurrencyInfo {
  final String code;
  final String title;
  final double actValue;
  final double varBid;
  final double pctChange;
  final double high;
  final double low;

  CurrencyInfo({
    required this.code,
    required this.title,
    required this.actValue,
    required this.varBid,
    required this.pctChange,
    required this.high,
    required this.low,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'title': title,
      'actValue': actValue,
      'varBid': varBid,
      'pctChange': pctChange,
      'high': high,
      'low': low,
    };
  }

  factory CurrencyInfo.fromMap(Map<String, dynamic> map) {
    return CurrencyInfo(
      code: map['code'] as String,
      title: map['title'] as String,
      actValue: map['actValue'] as double,
      varBid: map['varBid'] as double,
      pctChange: map['pctChange'] as double,
      high: map['high'] as double,
      low: map['low'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrencyInfo.fromJson(String source) => CurrencyInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
