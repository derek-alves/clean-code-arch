import 'package:design_patterns/scructural/adapter/stripe_transaction.dart';
import 'package:design_patterns/scructural/adapter/transaction.dart';

class StripeTransactionAdapter implements Transaction {
  @override
  late final String id;
  @override
  late final double amount;
  @override
  late final String status;

  StripeTransactionAdapter(StripeTransaction stripeTransaction) {
    id = stripeTransaction.code;
    amount = stripeTransaction.amount;
    status = stripeTransaction.situation.toString();
  }
}
