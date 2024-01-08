import 'package:alpha_work/Model/staticPageModel.dart';
import 'package:alpha_work/Model/vendorProfileModel.dart';
import 'package:alpha_work/Utils/appUrls.dart';
import 'package:alpha_work/Utils/shared_pref..dart';
import 'package:alpha_work/repository/profileRepository.dart';
import 'package:flutter/material.dart';

class ProfileViewModel with ChangeNotifier {
  ProfileRepository _myRepo = ProfileRepository();
  late VendorData vendorData;
  late StaticPageData staticPageData;
  bool isLoading = true;
  bool get loading => isLoading;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  //Function to get vendor profile data
  Future<void> getvendorProfileData() async {
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    String phone = PreferenceUtils.getString(PrefKeys.mobile);
    isLoading = true;
    await _myRepo
        .vendorProfileGetRequest(
            api: AppUrl.vendorProfile, token: token, phone: phone)
        .then((value) {
      print(value.data.first.fName);
      vendorData = value.data.first;
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
  }

  //Function to update business Detail
  Future<Map<String, dynamic>> updateBusinessDetail({
    required String bussiness_email_id,
    required String bussiness_type,
    required String company_name,
    required String gst_in,
    required String bussiness_registeration_number,
    required String tax_identification_number,
  }) async {
    Map<String, dynamic> val = {'status': false, 'msg': 'Something went wrong'};
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    await _myRepo
        .updateBusinessDetail(
      api: AppUrl.updateBusinessDetail,
      token: token,
      bussiness_email_id: bussiness_email_id,
      bussiness_type: bussiness_type,
      company_name: company_name,
      gst_in: gst_in,
      bussiness_registeration_number: bussiness_registeration_number,
      tax_identification_number: tax_identification_number,
    )
        .then((value) {
      val['status'] = value['status'];
      val['msg'] = value['message'];
    });
    return val;
  }

  //Function to update Address Detail
  Future<Map<String, dynamic>> updateAddressDetail({
    required String address,
    required String country,
    required String state,
    required String city,
    required String pincode,
  }) async {
    Map<String, dynamic> val = {'status': false, 'msg': 'Something went wrong'};
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    await _myRepo
        .updateAddressDetail(
            api: AppUrl.updateAddressDetail,
            token: token,
            address: address,
            country: country,
            state: state,
            city: city,
            pincode: pincode)
        .then((value) {
      val['status'] = value['status'];
      val['msg'] = value['message'];
    });
    return val;
  }

//Function to update Bank Detail
  Future<Map<String, dynamic>> updateBankDetail({
    required String bank_name,
    required String branch_name,
    required String account_type,
    required String micr_code,
    required String bank_address,
    required String account_number,
    required String ifsc_code,
  }) async {
    Map<String, dynamic> val = {'status': false, 'msg': 'Something went wrong'};
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    await _myRepo
        .updateBankDetail(
            api: AppUrl.updateBankingDetail,
            token: token,
            bank_name: bank_name,
            branch_name: branch_name,
            account_type: account_type,
            micr_code: micr_code,
            bank_address: bank_address,
            account_number: account_number,
            ifsc_code: ifsc_code)
        .then((value) {
      val['status'] = value['status'];
      val['msg'] = value['message'];
    });
    return val;
  }

//Function to update Bank Detail
  Future<Map<String, dynamic>> updateProfileDetail({
    required String name,
    required String email,
    required String phone,
    required String imageUrl,
  }) async {
    Map<String, dynamic> val = {'status': false, 'msg': 'Something went wrong'};
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    await _myRepo
        .updateProfileDetail(
            api: AppUrl.updateProfileDetail,
            token: token,
            name: name,
            email: email,
            image: imageUrl,
            phone: phone)
        .then((value) {
      val['status'] = value['status'];
      val['msg'] = value['message'];
    });
    await getvendorProfileData();
    return val;
  }

//Function to fetch static page data(faq,privacy-policy etc)
  Future<void> getStaticPageData() async {
    isLoading = true;
    await _myRepo.staticPageGetRequest(api: AppUrl.staticPage).then((value) {
      staticPageData = value.data!;
      setLoading(false);
    });
  }

//Function to change password
  Future<String> cahngePassword({
    required String old_password,
    required String newPass,
    required String confirmPass,
  }) async {
    String msg = '';
    String token = PreferenceUtils.getString(PrefKeys.jwtToken);
    await _myRepo
        .updateProfilePassword(
      api: AppUrl.updatePassword,
      token: token,
      old_password: old_password,
      newPass: newPass,
      confirmPass: confirmPass,
    )
        .then((value) {
      if (value) {
        msg = "Password updated sucessfully";
      } else {
        msg = "Something went wrong!";
      }
      setLoading(false);
    });
    return msg;
  }
}
