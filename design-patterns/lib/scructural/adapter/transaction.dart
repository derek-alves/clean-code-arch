abstract class Transaction {
  final String id;
  final double amount;
  final String status;

  Transaction(this.id, this.amount, this.status);
}
