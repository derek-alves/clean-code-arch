// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:project/utils/custom_env.dart';
import 'package:test/test.dart';
import 'package:dio/dio.dart';

void main() {
  late final Dio dio;
  late final String url;
  setUpAll(() async {
    dio = Dio(BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ));
    String serverAdress = await CustomEnv.get(key: "server_address");
    String serverPort = await CustomEnv.get(key: "server_port");
    url = 'http://${serverAdress}:${serverPort}/';
  });
  test("Should create order", () async {
    var response = await dio.post(url + "orders", data: {
      "cpf": "457.046.588-90",
      "orderItems": [
        {"idItem": 1, "quantity": 1},
        {"idItem": 2, "quantity": 1},
        {"idItem": 3, "quantity": 3}
      ],
      "date": DateTime(2022, 11, 11).microsecondsSinceEpoch,
      "coupon": "VALE20"
    });
    expect(response.statusCode, equals(200));
  });
}
