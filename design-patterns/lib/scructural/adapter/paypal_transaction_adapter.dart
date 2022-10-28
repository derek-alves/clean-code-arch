import 'package:design_patterns/scructural/adapter/paypal_transaction.dart';
import 'package:design_patterns/scructural/adapter/transaction.dart';

class PaypalTransactionAdapter implements Transaction {
  @override
  late final String id;
  @override
  late final double amount;
  @override
  late final String status;

  PaypalTransactionAdapter(PaypalTransaction paypalTransaction) {
    id = paypalTransaction.id.toString();
    amount = paypalTransaction.amount;
    status = convertStatus(paypalTransaction.status);
  }

  @override
  String convertStatus(situation) {
    const status = {
      "P": "waiting_payment",
      "S": "paid",
      "F": "refunded",
    };
    return status[situation] ?? "";
  }
}
