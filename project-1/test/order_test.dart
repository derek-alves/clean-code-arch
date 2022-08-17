import 'package:project/coupon.dart';
import 'package:project/item.dart';
import 'package:project/order.dart';
import 'package:test/test.dart';

void main() {
  test('Deve criar um pedido vazio com CPF válido', () async {
    const cpf = "839.435.452-10";
    final order = Order(cpf: cpf);
    double total = order.total;
    expect(total, equals(0));
  });

  test('Deve tentar criar um pedido vazio com CPF inválido', () async {
    const cpf = "111.111.111-10";
    expect(() => Order(cpf: cpf), throwsException);
  });

  test('Deve criar um pedido com 3 itens', () {
    const cpf = "839.435.452-10";
    final order = Order(cpf: cpf);
    order.addItem(
      Item(id: 1, category: 'Musica', description: "CD", price: 30),
      quantity: 3,
    );
    order.addItem(
      Item(id: 2, category: 'Video', description: "DVD", price: 50),
      quantity: 1,
    );
    order.addItem(
      Item(id: 3, category: 'Video', description: "VHS", price: 10),
      quantity: 2,
    );
    double total = order.total;
    expect(total, equals(160));
  });

  test('Deve criar um pedido com 3 itens com um cupom de desconto', () {
    const cpf = "839.435.452-10";
    final order = Order(cpf: cpf);
    order.addItem(
      Item(id: 1, category: 'Musica', description: "CD", price: 30),
      quantity: 3,
    );
    order.addItem(
      Item(id: 2, category: 'Video', description: "DVD", price: 50),
      quantity: 1,
    );
    order.addItem(
      Item(id: 3, category: 'Video', description: "VHS", price: 10),
      quantity: 2,
    );

    order.addCoupon(Coupon("VALE20", 20));

    double total = order.total;
    expect(total, equals(128));
  });
}
