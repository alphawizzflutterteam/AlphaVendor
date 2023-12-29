import 'dart:convert';

import 'package:alpha_work/Model/productManagementModel.dart';
import 'package:alpha_work/View/Product/model/productListModel.dart';
import 'package:http/http.dart' as http;

import '../Model/currencyModel.dart';

class ProductManagementRepository {
  Future<ProductManagementModel> ProductMgmtDataRequest(
      {required String api, required String bearerToken}) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    var jsonData = jsonDecode(res.body);

    return ProductManagementModel.fromJson(jsonData);
  }

  Future<ProductListModel> ProductListRequest(
      {required String api,
      required String bearerToken,
      required String type}) async {
    final queryParameters = {
      'status': type,
    };
    final url = Uri.parse(api).replace(queryParameters: queryParameters);

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    var jsonData = jsonDecode(res.body);
    return ProductListModel.fromJson(jsonData);
  }
}
