import 'coupon.dart';
import 'cpf.dart';
import 'item.dart';
import 'order_item.dart';

class Order {
  Cpf? cpf;
  final List<OrderItem> orderItems = [];
  Coupon? coupon;
  late DateTime date;
  double _freight = 0;

  Order({required String cpf, DateTime? date}) {
    this.date = date ?? DateTime.now();
    this.cpf = Cpf(cpf);
  }

  void addItem(Item item, {required int quantity}) {
    _freight += item.calculateFreight() * quantity;
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
