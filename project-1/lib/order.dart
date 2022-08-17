import 'coupon.dart';
import 'cpf.dart';
import 'item.dart';
import 'order_item.dart';

class Order {
  Cpf? cpf;
  final List<OrderItem> orderItems = [];
  Coupon? coupon;

  Order({required String cpf}) {
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

  void addCoupon(Coupon coupon) => this.coupon = coupon;

  double get total {
    double total = 0;
    for (var orderItem in orderItems) {
      total += orderItem.totalPrice;
    }
    if (coupon != null) {
      total -= (total * coupon!.percentage) / 100;
    }
    return total;
  }
}
