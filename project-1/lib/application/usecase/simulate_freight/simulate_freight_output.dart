class SimulateFreightOutput {
  final double amount;

  SimulateFreightOutput({required this.amount});

  Map<String, dynamic> toJson() => {"amount": amount};
}
