import 'dart:convert';

import 'package:http/http.dart' as http;

class PaymentRepository {
  //TODO: your api key.
  static const String apiKey = 'xxxxxx';

  Future<String> authenticationRequest() async {
    const String authenticationUrl =
        'https://accept.paymob.com/api/auth/tokens';
    try {
      final response = await http.post(
        Uri.parse(authenticationUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"api_key": PaymentRepository.apiKey}),
      );
      return jsonDecode(response.body)['token'];
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<int> orderRegistrationAPI() async {
    String token = await authenticationRequest();
    const String orderRegistrationUrl =
        'https://accept.paymob.com/api/ecommerce/orders';
    try {
      final response = await http.post(
        Uri.parse(orderRegistrationUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "auth_token": token,
          "delivery_needed": "false",
          "amount_cents": "100",
          "currency": "EGP",
          "terminal_id": 23772,
          "merchant_order_id": 35,
          "items": [
            {
              "name": "ASC1515",
              "amount_cents": "500000",
              "description": "Smart Watch",
              "quantity": "1"
            },
            {
              "name": "ERT6565",
              "amount_cents": "200000",
              "description": "Power Bank",
              "quantity": "1"
            }
          ],
          "shipping_data": {
            "apartment": "803",
            "email": "claudette09@exa.com",
            "floor": "42",
            "first_name": "Clifford",
            "street": "Ethan Land",
            "building": "8028",
            "phone_number": "+86(8)9135210487",
            "postal_code": "01898",
            "extra_description": "8 Ram , 128 Giga",
            "city": "Jaskolskiburgh",
            "country": "CR",
            "last_name": "Nicolas",
            "state": "Utah"
          },
          "shipping_details": {
            "notes": " test",
            "number_of_packages": 1,
            "weight": 1,
            "weight_unit": "Kilogram",
            "length": 1,
            "width": 1,
            "height": 1,
            "contents": "product of some sorts"
          }
        }),
      );
      print(response.statusCode);
      return jsonDecode(response.body)['id'];
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<String> paymentKeyRequest() async {
    String token = await authenticationRequest();
    int id = await orderRegistrationAPI();
    const String paymentKeyUrl =
        'https://accept.paymob.com/api/acceptance/payment_keys';
    try {
      final response = await http.post(
        Uri.parse(paymentKeyUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "auth_token": token,
          "amount_cents": "100",
          "expiration": 3600,
          "order_id": "$id",
          "billing_data": {
            "apartment": "803",
            "email": "claudette09@exa.com",
            "floor": "42",
            "first_name": "Clifford",
            "street": "Ethan Land",
            "building": "8028",
            "phone_number": "+86(8)9135210487",
            "shipping_method": "PKG",
            "postal_code": "01898",
            "city": "Jaskolskiburgh",
            "country": "CR",
            "last_name": "Nicolas",
            "state": "Utah"
          },
          "currency": "EGP",
          //TODO: your integration id
          "integration_id": 0
        }),
      );
      print(response.statusCode);
      return jsonDecode(response.body)['token'];
    } catch (e) {
      print(e);
      return '';
    }
  }
}
