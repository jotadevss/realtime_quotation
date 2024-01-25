import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realtime_quotation/infra/contracts/repositories/currency_repository.dart';
import 'package:realtime_quotation/models/currency.dart';

class HttpCurrencyRepository implements ICurrencyRepository {
  final _client = http.Client();

  @override
  Future<List<Currency>> fetchAll() async {
    try {
      final url = Uri.parse('https://economia.awesomeapi.com.br/json/available/uniq');
      final response = await _client.get(url);

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      final body = response.body;
      final map = jsonDecode(body) as Map<String, dynamic>;
      final currencies = map.entries.map((entry) => Currency(code: entry.key, title: entry.value)).toList();
      return currencies;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Currency>> fetchSelected(List<String> codes) async {
    try {
      final url = Uri.parse('https://economia.awesomeapi.com.br/json/available/uniq');
      final response = await _client.get(url);

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      final body = response.body;
      final map = jsonDecode(body) as Map<String, dynamic>;
      final selected = <Currency>[];

      for (var code in codes) {
        if (map[code] != null) {
          selected.add(Currency(code: code, title: map[code]));
        }
      }

      return selected;
    } catch (e) {
      rethrow;
    }
  }
}
