import 'package:project/src/account.dart';
import 'package:test/test.dart';

import 'currency_api_fake.dart';

void main() {
  test('Deve criar uma conta', () {
    Account account = Account(CurrencyApiFake());
    final double balance = account.getBalance;

    expect(balance, equals(0));
  });

  test("Deve fazer um crédito de R\$100,00", () {
    Account account = Account(CurrencyApiFake());
    account.credit(100);
    final balance = account.getBalance;
    expect(balance, equals(100));
  });

  test("Deve fazer um debit de R\$50,00", () {
    Account account = Account(CurrencyApiFake());
    account.credit(100);
    account.debit(50);
    final balance = account.getBalance;
    expect(balance, equals(50));
  });

  test("Deve fazer um crédito de U\$100,00 com fake", () {
    Account account = Account(CurrencyApiFake());
    account.credit(100, "USD");
    final balance = account.getBalance;
    expect(balance, equals(500));
  });
}
