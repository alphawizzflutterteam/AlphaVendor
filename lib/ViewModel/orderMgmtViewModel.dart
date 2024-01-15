import 'dart:ffi';

import 'package:alpha_work/Utils/appUrls.dart';
import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/shared_pref..dart';
import 'package:alpha_work/Utils/utils.dart';
import 'package:alpha_work/View/ORDER/model/derliveryManModel.dart';
import 'package:alpha_work/View/ORDER/model/orderModel.dart';
import 'package:alpha_work/repository/orderMgmtRepository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderManagementViewModel with ChangeNotifier {
  OrderManagementRepository _myRepo = OrderManagementRepository();

  List<OrderStatus> orderStatus = [];
  List<OrderData> orderList = [];
  List<DeliveryManData> deliveryMans = [];
  bool isLoading = true;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  //Function to fetch orders based on status
  Future<void> getOrderList({required String status}) async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    isLoading = true;
    orderList.clear();
    await _myRepo
        .orderListGetRequest(
            api: AppUrl.orderList, token: token, status: status)
        .then((value) {
      print(value.data.length);
      if (orderStatus.isEmpty) {
        orderStatus = value.orderStatus;
        notifyListeners();
        print(orderStatus.length);
      }
      orderList = value.data;
      print(orderList.first.detail!.name);
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }

//Function to fetch delivery man list
  Future<void> getDeliveryManList() async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    isLoading = true;
    await _myRepo.DeliveryManListGetRequest(
            api: AppUrl.DeliveryMan, token: token)
        .then((value) {
      deliveryMans.clear();
      deliveryMans = value.data;
      print(deliveryMans.length);
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }

// Function to assign Driver and ship order
  Future<Map<String, String>> assignDeliveryMan({
    required String delivery_man_id,
    required String order_id,
    required String expected_delivery_date,
  }) async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    isLoading = true;
    Map<String, String> val = {};
    await _myRepo
        .assignDeliveryManPostRequest(
            token: token,
            api: AppUrl.assignDriver,
            delivery_man_id: delivery_man_id,
            order_id: order_id,
            expected_delivery_date: expected_delivery_date)
        .then((value) {
      print(value);
      val = value;
      setLoading(false);
      return val;
    }).onError((error, stackTrace) => setLoading(false));
    return val;
  }

//Function to cancel order status
  Future<bool> cancelOrder({
    required BuildContext ctx,
    required String id,
  }) async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    isLoading = false;
    bool val = false;
    print(token);
    await _myRepo
        .orderStatusUpatePutRequest(
            api: "${AppUrl.orderStatusUpdate}$id", token: token)
        .then((value) {
      val = value['status'].toString() == 'true' ? true : false;
    }).onError((error, stackTrace) => setLoading(false));
    return val;
  }
}
