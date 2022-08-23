import 'package:project/domain/entity/coupon.dart';
import 'package:project/domain/entity/default_freight_calculator.dart';
import 'package:project/domain/entity/fixed_freight_calculator.dart';
import 'package:project/domain/entity/item.dart';
import 'package:project/domain/entity/order.dart';

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

  test('Deve criar pedido com um cupom de desconto expirado', () {
    const cpf = "839.435.452-10";
    final order = Order(cpf: cpf, date: DateTime(2022, 8, 14));
    order.addItem(
      Item(
        id: 1,
        category: 'Musica',
        description: "CD",
        price: 30,
      ),
      quantity: 3,
    );
    order.addCoupon(Coupon("VALE20", 20, DateTime(2022, 8, 13)));

    double total = order.total;
    expect(total, equals(90));
  });

  test('Deve criar um pedido com 3 itens com o cáculo do frete', () {
    const cpf = "839.435.452-10";
    final order = Order(cpf: cpf);
    order.addItem(
      Item(
        id: 4,
        category: 'Instrumentos Musicais',
        description: "guitarra",
        price: 1000,
        width: 100,
        height: 30,
        depth: 10,
        weight: 3,
      ),
      quantity: 1,
    );
    order.addItem(
      Item(
        id: 5,
        category: 'Instrumentos Musicais',
        description: "Amplificador",
        price: 5000,
        width: 100,
        height: 50,
        depth: 50,
        weight: 20,
      ),
      quantity: 1,
    );
    order.addItem(
      Item(
        id: 6,
        category: 'Acessórios',
        description: "Cabo",
        price: 30,
        width: 10,
        height: 10,
        depth: 10,
        weight: 0.9,
      ),
      quantity: 3,
    );
    double freight = order.getFreight();
    expect(freight, equals(260));
  });

  test(
      'Deve criar um pedido com 3 itens com o cáculo do frete com estrategia default',
      () {
    const cpf = "839.435.452-10";
    final order =
        Order(cpf: cpf, freightCalculator: DefaultFreightCalculator());
    order.addItem(
      Item(
        id: 4,
        category: 'Instrumentos Musicais',
        description: "guitarra",
        price: 1000,
        width: 100,
        height: 30,
        depth: 10,
        weight: 3,
      ),
      quantity: 1,
    );
    order.addItem(
      Item(
        id: 5,
        category: 'Instrumentos Musicais',
        description: "Amplificador",
        price: 5000,
        width: 100,
        height: 50,
        depth: 50,
        weight: 20,
      ),
      quantity: 1,
    );
    order.addItem(
      Item(
        id: 6,
        category: 'Acessórios',
        description: "Cabo",
        price: 30,
        width: 10,
        height: 10,
        depth: 10,
        weight: 0.9,
      ),
      quantity: 3,
    );
    double freight = order.getFreight();
    expect(freight, equals(260));
  });

  test(
      'Deve criar um pedido com 3 itens com o cáculo do frete com estrategia fixo',
      () {
    const cpf = "839.435.452-10";
    final order = Order(cpf: cpf, freightCalculator: FixedFreightCalculator());
    order.addItem(
      Item(
        id: 4,
        category: 'Instrumentos Musicais',
        description: "guitarra",
        price: 1000,
        width: 100,
        height: 30,
        depth: 10,
        weight: 3,
      ),
      quantity: 1,
    );
    order.addItem(
      Item(
        id: 5,
        category: 'Instrumentos Musicais',
        description: "Amplificador",
        price: 5000,
        width: 100,
        height: 50,
        depth: 50,
        weight: 20,
      ),
      quantity: 1,
    );
    order.addItem(
      Item(
        id: 6,
        category: 'Acessórios',
        description: "Cabo",
        price: 30,
        width: 10,
        height: 10,
        depth: 10,
        weight: 0.9,
      ),
      quantity: 3,
    );
    double freight = order.getFreight();
    expect(freight, equals(50));
  });
}
