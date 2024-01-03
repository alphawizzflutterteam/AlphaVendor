import 'package:alpha_work/Model/productManagementModel.dart';
import 'package:alpha_work/Utils/appUrls.dart';
import 'package:alpha_work/Utils/shared_pref..dart';
import 'package:alpha_work/View/Product/model/brandModel.dart';
import 'package:alpha_work/View/Product/model/categoryModel.dart';
import 'package:alpha_work/View/Product/model/productDetailModel.dart';
import 'package:alpha_work/View/Product/model/productListModel.dart';
import 'package:alpha_work/repository/productMgmtEepository.dart';
import 'package:flutter/material.dart';

class ProductManagementViewModel extends ChangeNotifier {
  final _myRepo = ProductManagementRepository();
  late ManagementData productManagementData;
  List<ProductData> productList = [];
  List<CategoryData> categories = [];
  List<CategoryData> subcategories = [];
  List<CategoryData> subsubcategories = [];
  List<BrandData> brandList = [];
  List<Product> productDetail = [];
  bool isLoading = true;
  CategoryData? selectedCat;
  CategoryData? selectedSubCat;
  CategoryData? selectedSubSubCat;
  BrandData? selectedBrand;
  String thumbnail = '';
  bool get loading => isLoading;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  setCategory(var value) {
    selectedCat = value;
    notifyListeners();
  }

  subCategoryclear() {
    subcategories.clear();
    selectedSubCat = null;
    notifyListeners();
  }

  setSubCategory(var value) {
    selectedSubCat = value;
    notifyListeners();
  }

  setBrand(var value) {
    selectedBrand = value;
    notifyListeners();
  }

//Function to get productmgmt list
  Future<void> getProductManagement() async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    await _myRepo.ProductMgmtDataRequest(
            api: AppUrl.productMgmt, bearerToken: token)
        .then((value) {
      productManagementData = value.data!;
      print(productManagementData.categories.length);

      print("here");
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }

//Function to get Product list based on status (Active,Inactive,All)
  Future<void> getProductsListWithStatus({required String Type}) async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    print(Type);
    isLoading = true;
    await _myRepo.ProductListRequest(
            api: AppUrl.productList, bearerToken: token, type: Type)
        .then((value) {
      productList = value.data!;
      print("Product list length ${productList.length}");
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }

//Function to get category with id
  Future<void> getCategory({required String id}) async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    subsubcategories.clear();
    await _myRepo
        .categoryListRequest(
            api: AppUrl.categoriesList, bearerToken: token, id: id)
        .then((value) {
      categories = value.data;
      print("here");
      print(categories.length);
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }

  //Function to get category with id
  Future<void> getsubCategory({required String id}) async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    subcategories.clear();
    setLoading(true);
    await _myRepo
        .categoryListRequest(
            api: AppUrl.categoriesList, bearerToken: token, id: id)
        .then((value) {
      subcategories = value.data;

      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }

  //Function to get category with id
  Future<void> getsubsubCategory({required String id}) async {
    subcategories.clear();

    await _myRepo
        .categoryListRequest(
            api: AppUrl.categoriesList, bearerToken: AppUrl.apitoken, id: id)
        .then((value) {
      subsubcategories = value.data;
      print("here");
      print(categories.length);
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }

//Funcation to get brand data
  Future<void> getBrandList() async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    await _myRepo
        .brandListRequest(
      api: AppUrl.brandList,
      bearerToken: token,
    )
        .then((value) {
      brandList = value.data;

      print("Btand list  ${brandList.length}");
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }

//Function to upload Image
  Future<void> getImageUrl({required String path}) async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    await _myRepo
        .uploadImage(path: path, api: AppUrl.imageUpload, token: token)
        .then((value) {
      thumbnail = value;
    });
  }

//Function to add product
  Future<bool> appProduct({
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
    bool status = false;
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    await _myRepo
        .addProductPostRequest(
          token: token,
          api: AppUrl.addProduct,
          name: name,
          category_id: category_id,
          sub_category_id: sub_category_id,
          product_type: product_type,
          unit: unit,
          thumbnail: thumbnail,
          discount_type: discount_type,
          discount: discount,
          tax: tax,
          tax_type: tax_type,
          unit_price: unit_price,
          shipping_cost: shipping_cost,
          skuId: skuId,
          minimum_order_qty: minimum_order_qty,
          brand_id: brand_id,
          quantity: quantity,
          description: description,
          purchase_price: purchase_price,
        )
        .then((value) => status = value);
    return status;
  }

//Funtion to get product details
  Future<void> getProductDetail({required String id}) async {
    isLoading = true;
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    await _myRepo
        .productDetailGetRequest(
            api: AppUrl.productDetailAndedit, bearerToken: token, id: id)
        .then((value) {
      print(value.product.first.name);
      productDetail = value.product;
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }

//Function to update product status
  Future<void> updateProductStatus(
      {required String id, required String status}) async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    await _myRepo
        .productStatusUpdateGetRequest(
            api: AppUrl.statusUpdate,
            bearerToken: token,
            status: status,
            id: id)
        .then((value) => print(value))
        .then((value) => setLoading(false));
  }
}
