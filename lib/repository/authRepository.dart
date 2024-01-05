import 'dart:convert';
import 'package:alpha_work/View/AUTH/LOGIN/model/OtpModel.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  //Function get login otp
  Future<LoginOtpModel> loginOtpPostRequest(
      {required String api, required String phone}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(api));
      request.fields.addAll({'phone': phone});
      http.StreamedResponse response = await request.send();
      var ans = jsonDecode(await response.stream.bytesToString());
      if (response.statusCode == 200 || response.statusCode == 401) {
        print(ans);
        return LoginOtpModel.fromJson(ans);
      } else {
        print(response.reasonPhrase);
        return LoginOtpModel(
            status: false,
            message: "Something went wrong",
            token: null,
            errors: [],
            data: [],
            otp: "");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //Function get login otp
  Future<LoginOtpModel> registerOtpPostRequest(
      {required String api, required String phone}) async {
    try {
      print(phone);
      print(api);
      var request = http.MultipartRequest('POST', Uri.parse(api));
      request.fields.addAll({'phone': phone});
      http.StreamedResponse response = await request.send();
      var ans = jsonDecode(await response.stream.bytesToString());
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 401) {
        print(ans);
        return LoginOtpModel.fromJson(ans);
      } else {
        print(response.reasonPhrase);
        return LoginOtpModel(
            status: false,
            message: "Something went wrong",
            token: null,
            errors: [],
            data: [],
            otp: "");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //Function to register vendor
  Future<bool> registerVendorPostRequest({
    required String api,
    required String phone,
    required String otp,
    required String name,
    required String email,
    required String referalcode,
    required String businessemail,
    required String businessphoneNo,
    required String businessname,
    required String businessType,
    required String registrationNo,
    required String gstin,
    required String tin,
    required String website,
    required String password,
    required String confirmPass,
    required String addr,
    required String city,
    required String state,
    required String zip,
    required String country,
    required String bankName,
    required String branch,
    required String accType,
    required String micr,
    required String bankAddr,
    required String accNo,
    required String ifsc,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(api));
      request.fields.addAll({
        'email': email,
        'name': name,
        'phone': phone,
        'referral_code': referalcode,
        'bussiness_email': businessemail,
        'bussiness_phone': businessphoneNo,
        'bussiness_type': businessType,
        'shop_name': businessname,
        'registeration_number': registrationNo,
        'gst_in': gstin,
        'tax_identification_number': tin,
        'website_link': website,
        'password': password,
        'confirm_password': confirmPass,
        'address': addr,
        'city': city,
        'state': state,
        'pincode': zip,
        'country': country,
        'bank_name': bankName,
        'branch_name': branch,
        'account_type': accType,
        'micr_code': micr,
        'bank_address': bankAddr,
        'account_number': accNo,
        'ifsc_code': ifsc,
        'otp': otp,
      });
      http.StreamedResponse response = await request.send();
      var res = await jsonDecode(await response.stream.bytesToString());
      print(res);
      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return res['status'];
      } else {
        print(response.reasonPhrase);
        return res['status'];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
