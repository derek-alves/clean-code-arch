import 'package:design_patterns/scructural/adapter/paypal_transaction.dart';
import 'package:design_patterns/scructural/adapter/stripe_transaction.dart';
import 'package:test/test.dart';

//Converter a interface de uma classe em outra interface, esperada pelos clientes
//permitindo que as classes com interfaces imcompatíveis trabalhem juntas

void main() {
  test('Deve criar uma transação do Stripe', () async {
    final stripTransaction = StripeTransaction("AHN786AB8", 1000, 2);
    expect(stripTransaction.code, equals('AHN786AB8'));
  });

  test('Deve criar uma transação do paypal', () async {
    final stripTransaction = PaypalTransaction(74747474, 1000, "S");
    expect(stripTransaction.id, equals(74747474));
  });

  test('Deve criar uma transação a partir do Stripe', () async {
    final stripeTransaction = StripeTransaction("AHN786AB8", 1000, 2);
    final transaction = StripeTransactionAdapter(stripeTransaction);
    expect(transaction.id, equals('AHN786AB8'));
    expect(transaction.amount, equals(1000));
    expect(transaction.status, equals('paid'));
  });
}
