import 'dart:convert';
import 'dart:developer';

import 'package:alpha_work/Model/productManagementModel.dart';
import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/View/Product/model/brandModel.dart';
import 'package:alpha_work/View/Product/model/categoryModel.dart';
import 'package:alpha_work/View/Product/model/productDetailModel.dart';
import 'package:alpha_work/View/Product/model/productListModel.dart';
import 'package:alpha_work/Widget/commanTost.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  //Function to fetch product list (Active,Inactive)
  Future<ProductListModel> ProductListRequest(
      {required String api,
      required String bearerToken,
      required String type,
      required String? cat,
      required String? subcat,
      required bool isCat}) async {
    final queryParameters = {
      'status': type,
    };
    final queryParameterscat = {
      'status': type,
      'category_id': cat,
      'sub_category_id': subcat,
    };
    try {
      final url = Uri.parse(api).replace(
          queryParameters: isCat ? queryParameterscat : queryParameters);

      final http.Response res = await http.get(url, headers: {
        'Authorization': 'Bearer $bearerToken',
      });
      print(res.statusCode);
      print(url);
      if (res.statusCode == 200) {
        var jsonData = jsonDecode(res.body);
        return ProductListModel.fromJson(jsonData);
      } else {
        Fluttertoast.showToast(
            msg: "Something went wrong!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: colors.buttonColor,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return ProductListModel(data: [], message: null, status: null);
    } catch (e) {
      // Handle any exceptions that occur
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }

  //Function to get product category
  Future<CategoryModel> categoryListRequest(
      {required String api,
      required String bearerToken,
      required String id}) async {
    final queryParameters = {
      'parent_id': id,
    };
    try {
      final url = Uri.parse(api).replace(queryParameters: queryParameters);
      print(url);
      final http.Response res;
      res = await http.get(url, headers: {
        'Authorization': 'Bearer $bearerToken',
      });
      if (res.statusCode == 200) {
        var jsonData = jsonDecode(res.body);
        return CategoryModel.fromJson(jsonData);
      } else {
        Fluttertoast.showToast(
            msg: "Something went wrong!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: colors.buttonColor,
            textColor: Colors.white,
            fontSize: 16.0);
        return CategoryModel(status: null, message: null, data: []);
      }
    } catch (e) {
      // Handle any exceptions that occur
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }

//Function to get brand data
  Future<BrandModel> brandListRequest({
    required String api,
    required String bearerToken,
  }) async {
    try {
      final url = Uri.parse(api);
      final http.Response res;
      res = await http.get(url, headers: {
        'Authorization': 'Bearer $bearerToken',
      });
      print(res.statusCode);
      if (res.statusCode == 200) {
        var jsonData = jsonDecode(res.body);
        return BrandModel.fromJson(jsonData);
      } else {
        showTost();
        return BrandModel(status: null, message: null, data: []);
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }

// Function to upload image and get name
  Future<String> uploadImage(
      {required String path,
      required String api,
      required String token}) async {
    var headers = {'Authorization': token};
    var request = http.MultipartRequest('POST', Uri.parse(api));
    request.fields.addAll({'type': 'product'});
    request.files.add(await http.MultipartFile.fromPath('image', path));
    request.headers.addAll(headers);

    var response = await request.send();
    var ans = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      print(ans['image_name']);
      return ans['image_name'];
    } else {
      print(response.reasonPhrase);
      return "";
    }
  }

//Function to add product
  Future<bool> addProductPostRequest({
    required String token,
    required String api,
    required String name,
    required String category_id,
    required String sub_category_id,
    required String product_type,
    required String unit,
    required String thumbnail,
    required String discount_type,
    required String discount,
    required String tax,
    required String tax_type,
    required String unit_price,
    required String shipping_cost,
    required String skuId,
    required String minimum_order_qty,
    required String brand_id,
    required String quantity,
    required String description,
    required String purchase_price,
  }) async {
    var headers = {'Authorization': 'Bearer $token'};
    print(api);
    print(token);
    var request = http.MultipartRequest('POST', Uri.parse(api));
    request.fields.addAll({
      'name[]': name,
      'category_id': category_id,
      'sub_category_id': sub_category_id,
      'product_type': product_type,
      'unit': unit,
      'images[]': '',
      'thumbnail': thumbnail,
      'discount_type': discount_type,
      'tax_type': tax_type,
      'tax': tax,
      'unit_price': unit_price,
      'discount': discount,
      'shipping_cost': shipping_cost,
      'code': skuId,
      'minimum_order_qty': minimum_order_qty,
      'brand_id': brand_id,
      'quantity': quantity,
      'description[]': description,
      'lang[]': 'en',
      'purchase_price': purchase_price,
    });

    request.headers.addAll(
      headers,
    );

    http.StreamedResponse response = await request.send();
    var ans = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200 && ans['status'] == true) {
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

//Function to fetch product details
  Future<ProductDetailModel> productDetailGetRequest(
      {required String api,
      required String bearerToken,
      required String id}) async {
    try {
      final url = Uri.parse("$api$id");
      print(url);
      final http.Response res;
      res = await http.get(url, headers: {
        'Authorization': 'Bearer $bearerToken',
      });
      if (res.statusCode == 200) {
        var ans = jsonDecode(res.body);
        return ProductDetailModel.fromJson(ans);
      } else {
        showTost();
        return ProductDetailModel(status: null, message: null, product: []);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

//Function to update product status
  Future<bool> productStatusUpdateGetRequest(
      {required String api,
      required String bearerToken,
      required String status,
      required String id}) async {
    try {
      final url = Uri.parse(api).replace(queryParameters: {
        'id': id,
        'status': status,
      });
      print(url);
      final http.Response res;
      res = await http.get(url, headers: {
        'Authorization': 'Bearer $bearerToken',
      });
      if (res.statusCode == 200) {
        var ans = jsonDecode(res.body);
        print(ans);
        return true;
      } else {
        showTost();
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //Function to delete product
  Future<bool> deleteProductPostRequest(
      {required String api,
      required String bearerToken,
      required String id}) async {
    try {
      var headers = {'Authorization': 'Bearer $bearerToken'};
      var request = http.Request('DELETE', Uri.parse('$api$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var ans = jsonDecode(await response.stream.bytesToString());
        print(ans);
        return true;
      } else {
        showTost();
        print(response.stream.bytesToString());
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //Function to add product
  Future<bool> updateProductPostRequest({
    required String token,
    required String api,
    required String name,
    required String category_id,
    required String sub_category_id,
    required String product_type,
    required String unit,
    required String thumbnail,
    required String discount_type,
    required String discount,
    required String tax,
    required String tax_type,
    required String unit_price,
    required String shipping_cost,
    required String skuId,
    required String minimum_order_qty,
    required String brand_id,
    required String quantity,
    required String description,
    required String purchase_price,
  }) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var url = Uri.parse(api);
      print(api);
      print(token);
      var body = {
        'name[]': name,
        'category_id': category_id,
        'sub_category_id': sub_category_id,
        'product_type': product_type,
        'unit': unit,
        'images[]': '',
        'thumbnail': thumbnail,
        'discount_type': discount_type,
        'tax_type': tax_type,
        'tax': tax,
        'unit_price': unit_price,
        'discount': discount,
        'shipping_cost': shipping_cost,
        'code': skuId,
        'minimum_order_qty': minimum_order_qty,
        'brand_id': brand_id,
        'quantity': quantity,
        'description[]': description,
        'lang[]': 'en',
        'purchase_price': purchase_price,
      };
      final http.Response response;
      response = await http.put(url, headers: headers, body: body);
      var ans = jsonDecode(response.body);
      print(ans);
      print(response.statusCode);
      if (response.statusCode == 200 && ans['status'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
