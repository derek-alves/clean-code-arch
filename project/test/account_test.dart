import 'package:project/src/account.dart';
import 'package:test/test.dart';

void main() {
  late Account account;

  setUpAll(() {
    account = Account();
  });
  test('Deve criar uma conta', () {
    final double balance = account.getBalance;

    expect(balance, equals(0));
  });

  test("Deve fazer um crédito de R\$100,00", () {
    account.credit(100);
    final balance = account.getBalance;
    expect(balance, equals(100));
  });

  test("Deve fazer um debit de R\$50,00", () {
    account.credit(100);
    account.debit(50);
    final balance = account.getBalance;
    expect(balance, equals(50));
  });
}
