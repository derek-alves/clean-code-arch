import 'package:project/cpf_validate.dart';

class Order {
  final String cpf;

  Order(this.cpf) {
    if (!CpfValidate.run(cpf)) throw Exception('Inalid cpf');
  }

  int get total => 0;
}
