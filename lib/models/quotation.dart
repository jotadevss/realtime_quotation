// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Quotation {
  final String code;
  final String codeIn;
  final String title;
  final double actValue;
  final double varBid;
  final double pctChange;
  final double high;
  final double low;

  Quotation({
    required this.code,
    required this.codeIn,
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
      'codeIn': codeIn,
      'title': title,
      'actValue': actValue,
      'varBid': varBid,
      'pctChange': pctChange,
      'high': high,
      'low': low,
    };
  }

  factory Quotation.fromMap(Map<String, dynamic> map) {
    return Quotation(
      code: map['code'] as String,
      codeIn: map['codeIn'] as String,
      title: map['title'] as String,
      actValue: map['actValue'] as double,
      varBid: map['varBid'] as double,
      pctChange: map['pctChange'] as double,
      high: map['high'] as double,
      low: map['low'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quotation.fromJson(String source) => Quotation.fromMap(json.decode(source) as Map<String, dynamic>);
}
