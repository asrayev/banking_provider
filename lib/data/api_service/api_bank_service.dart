import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

import '../models/bank_cart_model.dart';

class ApiService {
  Future<List<BankCart>> getBankData() async {
    try {
      Response response =
      await https.get(Uri.parse("https://banking-api.free.mockoapp.net/user_cards"));
      if (response.statusCode == 200) {

        var jsonData = jsonDecode(response.body);
        List<BankCart> carts = (jsonData as List?)?.map((item) => BankCart.fromJson(item)).toList() ?? [];
      return carts;

      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}
