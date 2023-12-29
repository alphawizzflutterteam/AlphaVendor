import 'package:alpha_work/Model/productManagementModel.dart';
import 'package:alpha_work/Utils/appUrls.dart';
import 'package:alpha_work/View/Product/model/productListModel.dart';
import 'package:alpha_work/repository/productMgmtEepository.dart';
import 'package:flutter/material.dart';

class ProductManagementViewModel extends ChangeNotifier {
  final _myRepo = ProductManagementRepository();
  late ManagementData productManagementData;
  List<ProductListData> productList = [];
  bool isLoading = true;

  bool get loading => isLoading;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getProductManagement() async {
    await _myRepo.ProductMgmtDataRequest(
            api: AppUrl.productMgmt, bearerToken: AppUrl.apitoken)
        .then((value) {
      productManagementData = value.data!;
      print(productManagementData.categories.length);

      print("here");
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }

  Future<void> getActiveProducts({required String Type}) async {
    await _myRepo.ProductListRequest(
            api: AppUrl.productMgmt, bearerToken: AppUrl.apitoken, type: Type)
        .then((value) {
      print("here");
      print(value.data);
      productList = value.data;

      print(productList[0].name);
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }
}
