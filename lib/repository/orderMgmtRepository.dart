import 'dart:convert';

import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/View/ORDER/model/orderModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class OrderManagementRepository {
  Future<OrderModel> orderListGetRequest(
      {required String api,
      required String token,
      required String status}) async {
    try {
      final url = Uri.parse(api).replace(queryParameters: {'status': status});
      print(status);
      print(url);
      final http.Response res = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
      });
      print(res.statusCode);
      print(url);

      if (res.statusCode == 200) {
        print(res.body);
        var jsonData = jsonDecode(res.body);
        return OrderModel.fromJson(jsonData);
      } else {
        print(res.body);
        return OrderModel(
            status: null, message: null, data: [], orderStatus: []);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
