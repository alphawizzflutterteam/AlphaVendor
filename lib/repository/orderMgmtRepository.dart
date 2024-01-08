import 'dart:convert';

import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/View/ORDER/model/derliveryManModel.dart';
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

//Function to get DeliveryMan List
  Future<DeliveryManModel> DeliveryManListGetRequest({
    required String api,
    required String token,
  }) async {
    try {
      var url = Uri.parse(api);
      final http.Response res = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
      });
      var ans = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return DeliveryManModel.fromJson(ans);
      } else {
        print(res.reasonPhrase);
        return DeliveryManModel(status: null, message: "", data: []);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

//Function to assign driver
  Future<Map<String, String>> assignDeliveryManPostRequest({
    required String token,
    required String api,
    required String delivery_man_id,
    required String order_id,
    required String expected_delivery_date,
  }) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var url = Uri.parse(api);
      print(api);
      print(token);
      var body = {
        'delivery_man_id': delivery_man_id,
        'order_id': order_id,
        'expected_delivery_date': expected_delivery_date,
      };
      final http.Response response;
      response = await http.put(url, headers: headers, body: body);
      var ans = jsonDecode(response.body);
      print(ans);
      print(response.statusCode);
      if (response.statusCode == 200 && ans['status'] == true) {
        return {'msg': ans['message']};
      } else {
        return {'msg': ans['errors'][0]['message']};
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
