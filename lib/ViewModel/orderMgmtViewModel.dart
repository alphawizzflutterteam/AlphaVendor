import 'dart:ffi';

import 'package:alpha_work/Utils/appUrls.dart';
import 'package:alpha_work/Utils/shared_pref..dart';
import 'package:alpha_work/View/ORDER/model/orderModel.dart';
import 'package:alpha_work/repository/orderMgmtRepository.dart';
import 'package:flutter/material.dart';

class OrderManagementViewModel with ChangeNotifier {
  OrderManagementRepository _myRepo = OrderManagementRepository();
  // List<OrderData> pendingOrder = [];
  // List<OrderData> confirmedOrder = [];
  // List<OrderData> processOrder = [];
  // List<OrderData> outForDelOrder = [];
  // List<OrderData> deliveredOrder = [];
  // List<OrderData> refundOrder = [];
  // List<OrderData> failedgOrder = [];
  // List<OrderData> canceledOrder = [];
  List<OrderStatus> orderStatus = [];
  List<OrderData> orderList = [];
  bool isLoading = true;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  //Function to fetch orders based on status
  Future<void> getOrderList({required String status}) async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    isLoading = true;
    await _myRepo
        .orderListGetRequest(
            api: AppUrl.orderList, token: token, status: status)
        .then((value) {
      orderList.clear();
      print(value.data.length);
      if (orderStatus.isEmpty) {
        orderStatus = value.orderStatus;
        print(orderStatus.length);
      }
      orderList = value.data;
      print(orderList.first.detail!.name);
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }
}
