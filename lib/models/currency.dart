import 'dart:convert';

class Currency {
  final String code;
  final String title;

  Currency({
    required this.code,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'title': title,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      code: map['code'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Currency.fromJson(String source) => Currency.fromMap(json.decode(source) as Map<String, dynamic>);
}
