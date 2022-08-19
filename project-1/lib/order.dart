import 'package:project/freight_calculator.dart';

import 'coupon.dart';
import 'cpf.dart';
import 'default_freight_calculator.dart';
import 'item.dart';
import 'order_item.dart';

class Order {
  final FreightCalculator freightCalculator;
  final List<OrderItem> orderItems = [];
  late DateTime date;
  Cpf? cpf;
  Coupon? coupon;
  double _freight = 0;

  Order({
    required String cpf,
    DateTime? date,
    this.freightCalculator = const DefaultFreightCalculator(),
  }) {
    this.date = date ?? DateTime.now();
    this.cpf = Cpf(cpf);
  }

  void addItem(Item item, {required int quantity}) {
    _freight += freightCalculator.calculate(item) * quantity;
    orderItems.add(
      OrderItem(
        idItem: item.id,
        price: item.price,
        quantity: quantity,
      ),
    );
  }

  double getFreight() => _freight;

  void addCoupon(Coupon coupon) {
    if (coupon.isValid(date)) {
      this.coupon = coupon;
    }
  }

  double get total {
    double total = 0;
    for (var orderItem in orderItems) {
      total += orderItem.totalPrice;
    }
    if (coupon != null) {
      total -= coupon!.calculateDiscount(total, date);
    }
    return total;
  }
}
