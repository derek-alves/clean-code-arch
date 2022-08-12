class Account {
  late num balance;
  Account() {
    balance = 0;
  }

  double credit(double amount) {
    return balance += amount;
  }

  double debit(double amount) {
    return balance -= amount;
  }

  double get getBalance => balance.toDouble();
}
