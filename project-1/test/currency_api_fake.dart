import 'package:project/src/currency_api.dart';

class CurrencyApiFake implements CurrencyApi {
  @override
  num convert(num amount, String currency) {
    if (currency == "USD") {
      return amount * 5;
    }
    return amount;
  }
}
