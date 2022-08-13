import 'package:project/src/currency_api.dart';

class Account {
  final CurrencyApi currencyApi;
  late num balance;

  Account(this.currencyApi) {
    balance = 0;
  }

  credit(double amount, [String currency = "BRL"]) {
    if (currency.isNotEmpty) {
      amount = currencyApi.convert(amount, currency).toDouble();
    }
    balance += amount;
  }

  double debit(double amount) {
    return balance -= amount;
  }

  double get getBalance => balance.toDouble();
}
