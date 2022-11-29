import 'package:project/domain/entity/order_code.dart';

import 'coupon.dart';
import 'cpf.dart';
import 'default_freight_calculator.dart';
import 'freight_calculator.dart';
import 'item.dart';
import 'order_item.dart';

class Order {
  final int? id;
  final FreightCalculator freightCalculator;
  final List<OrderItem> _orderItems = [];
  late int date;
  Cpf? cpf;
  Coupon? coupon;
  double _freight = 0;
  OrderCode? _code;
  final int sequency;

  Order({
    this.id,
    required String cpf,
    DateTime? date,
    this.freightCalculator = const DefaultFreightCalculator(),
    this.sequency = 1,
    this.coupon,
  }) {
    this.date = (date ?? DateTime.now()).millisecondsSinceEpoch;

    this.cpf = Cpf(cpf);
    _code = OrderCode(date: date ?? DateTime.now(), sequency: sequency);
  }

  void addItem(Item item, {required int quantity}) {
    _freight += freightCalculator.calculate(item) * quantity;
    _orderItems.add(
      OrderItem(
        idItem: item.id,
        price: item.price,
        quantity: quantity,
      ),
    );
  }

  String getCPF() => cpf!.value;

  List<OrderItem> getOrdemItemList() => _orderItems;

  double getFreight() => _freight;

  void addCoupon(Coupon coupon) {
    if (coupon.isValid(DateTime.fromMillisecondsSinceEpoch(date))) {
      this.coupon = coupon;
    }
  }

  double get total {
    double total = 0;
    for (var orderItem in _orderItems) {
      total += orderItem.totalPrice;
    }
    if (coupon != null) {
      total -= coupon!
          .calculateDiscount(total, DateTime.fromMillisecondsSinceEpoch(date));
    }
    total += getFreight();
    return total;
  }

  String getCode() => _code!.value;

  factory Order.fromMap(Map<String, dynamic> map) => Order(
        cpf: map["cpf"],
        date: DateTime.fromMillisecondsSinceEpoch(map["issue_date"]),
        id: map["id"],
        sequency: map["id"],
        coupon: Coupon(map["coupon"]),
      );
}
