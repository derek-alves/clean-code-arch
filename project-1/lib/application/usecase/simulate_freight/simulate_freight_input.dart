class SimulateFreightInput {
  final List<SimulateFreightItemInput> items = [];

  SimulateFreightInput(List<Map<String, dynamic>> items) {
    for (var item in items) {
      this.items.add(SimulateFreightItemInput.fromMap(item));
    }
  }
}

class SimulateFreightItemInput {
  final int idItem;
  final int quantity;

  SimulateFreightItemInput(this.idItem, this.quantity);

  factory SimulateFreightItemInput.fromMap(Map<String, dynamic> map) =>
      SimulateFreightItemInput(
        map["idItem"],
        map["quantity"],
      );
}
