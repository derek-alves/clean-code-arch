import 'coupon.dart';
import 'cpf.dart';
import 'item.dart';
import 'order_item.dart';

class Order {
  Cpf? cpf;
  final List<OrderItem> orderItems = [];
  Coupon? coupon;
  late DateTime date;

  Order({required String cpf, DateTime? date}) {
    this.date = date ?? DateTime.now();
    this.cpf = Cpf(cpf);
  }

  void addItem(Item item, {required int quantity}) {
    orderItems.add(
      OrderItem(
        idItem: item.id,
        price: item.price,
        quantity: quantity,
      ),
    );
  }

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
