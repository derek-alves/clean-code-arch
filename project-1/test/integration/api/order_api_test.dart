// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:project/utils/make_url.dart';
import 'package:test/test.dart';
import 'package:dio/dio.dart';

void main() {
  late final Dio dio;
  late final String url;
  setUpAll(() async {
    dio = Dio();

    url = await MakeUrl.execute("order");
  });
  test("Deve testar a API /order POST", () async {
    var response = await dio.post(url, data: {
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

  test("Deve testar a API /order/simulateFright (POST)", () async {
    var response = await dio.post(url + "simulate-freight", data: [
      {"idItem": 4, "quantity": 1},
      {"idItem": 5, "quantity": 1},
      {"idItem": 6, "quantity": 3}
    ]);

    var data = jsonDecode(response.data);

    expect(data["amount"], equals(260));
  });
}
