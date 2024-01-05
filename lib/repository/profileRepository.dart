import 'dart:convert';

import 'package:alpha_work/Model/vendorProfileModel.dart';
import 'package:http/http.dart' as http;

class ProfileRepository {
//Function to fetch vendor profile data
  Future<VendorProfileModel> vendorProfileGetRequest({
    required String api,
    required String token,
    required String phone,
  }) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('GET', Uri.parse(api));
      request.fields.addAll({'phone': phone});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var res = await jsonDecode(await response.stream.bytesToString());
      print(res);
      if (response.statusCode == 200) {
        return VendorProfileModel.fromJson(res);
      } else {
        print(response.reasonPhrase);
        return VendorProfileModel.fromJson(res);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

//Function to update business details
  Future<dynamic> updateBusinessDetail({
    required String api,
    required String token,
    required String bussiness_email_id,
    required String bussiness_type,
    required String company_name,
    required String gst_in,
    required String bussiness_registeration_number,
    required String tax_identification_number,
  }) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST', Uri.parse(api));
      request.fields.addAll({
        'bussiness_email_id': bussiness_email_id,
        'bussiness_type': bussiness_type,
        'company_name': company_name,
        'gst_in': gst_in,
        'bussiness_registeration_number': bussiness_registeration_number,
        'tax_identification_number': tax_identification_number,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var res = await jsonDecode(await response.stream.bytesToString());
      if (response.statusCode == 200) {
        return res;
      } else {
        print(response.reasonPhrase);
        return res;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

//Function to update business details
  Future<dynamic> updateAddressDetail({
    required String api,
    required String token,
    required String address,
    required String country,
    required String state,
    required String city,
    required String pincode,
  }) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST', Uri.parse(api));
      request.fields.addAll({
        'address': address,
        'country': country,
        'state': state,
        'city': city,
        'pincode': pincode,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var res = await jsonDecode(await response.stream.bytesToString());
      if (response.statusCode == 200) {
        return res;
      } else {
        print(response.reasonPhrase);
        return res;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

//Function to update business details
  Future<dynamic> updateBankDetail({
    required String api,
    required String token,
    required String bank_name,
    required String branch_name,
    required String account_type,
    required String micr_code,
    required String bank_address,
    required String account_number,
    required String ifsc_code,
  }) async {
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST', Uri.parse(api));
      request.fields.addAll({
        'bank_name': bank_name,
        'branch_name': branch_name,
        'account_type': account_type,
        'micr_code': micr_code,
        'bank_address': bank_address,
        'account_number': account_number,
        'ifsc_code': ifsc_code,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var res = await jsonDecode(await response.stream.bytesToString());
      if (response.statusCode == 200) {
        return res;
      } else {
        print(response.reasonPhrase);
        return res;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
