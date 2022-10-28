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
    id = paypalTransaction.code;
    amount = PaypalTransaction.amount;
    status = _convertStatus(PaypalTransaction.situation);
  }

  String _convertStatus(int situation) {
    const status = {
      1: "waiting_payment",
      2: "paid",
      3: "cancelled",
    };

    return status[situation] ?? "";
  }
}
