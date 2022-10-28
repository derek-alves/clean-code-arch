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
    status = convertStatus(stripeTransaction.situation);
  }
  @override
  String convertStatus(situation) {
    const status = {
      1: "waiting_payment",
      2: "paid",
      3: "cancelled",
    };

    return status[situation] ?? "";
  }
}
