import 'dart:convert';

import 'package:alpha_work/ViewModel/loginOtpResponseModel.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<LoginOtpResponseModel> loginApiReqzuest(
      String api, dynamic data) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.post(url, body: data);
    var ans = jsonDecode(res.body);

    return LoginOtpResponseModel.fromJson(ans);
  }

  // Future<ResetPasswordModel> restPasswordAPI(
  //     String api, String bearerToken, dynamic data) async {
  //   final url = Uri.parse(api);

  //   print(api);
  //   final http.Response res;
  //   res = await http.put(url, body: data, headers: {
  //     'Authorization': 'Bearer $bearerToken',
  //     "Accept": "application/x-www-form-urlencoded"
  //   });

  //   print(res.body);

  //   return resetPasswordModelFromJson(res.body);
  // }

  // Future<ProfileModel> getProfileAPI(
  //     String api, String bearerToken, dynamic data) async {
  //   final url = Uri.parse(api);

  //   print(api);
  //   final http.Response res;
  //   res = await http.get(url, headers: {
  //     'Authorization': 'Bearer $bearerToken',
  //   });

  //   print(res.body);

  //   return profileModelFromJson(res.body);
  // }
}
