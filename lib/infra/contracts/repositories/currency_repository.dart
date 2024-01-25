import 'package:realtime_quotation/models/currency.dart';

abstract class ICurrencyRepository {
  Future<List<Currency>> fetchAll();
  Future<List<Currency>> fetchSelected(List<String> codes);
}
