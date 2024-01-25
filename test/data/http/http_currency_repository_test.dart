// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:realtime_quotation/infra/data/http/http_currency_repository.dart';
import 'package:realtime_quotation/models/currency.dart';

void main() {
  final repository = HttpCurrencyRepository();

  test('Fetch All', () async {
    final list = await repository.fetchAll();
    expect(list, isA<List<Currency>>());
  });

  test('Fetch Selected', () async {
    final codes = ["USD", "BRL", "EUR"];
    final list = await repository.fetchSelected(codes);
    expect(
        list,
        allOf([
          isA<List<Currency>>(),
          isNotEmpty,
        ]));
  });
}
