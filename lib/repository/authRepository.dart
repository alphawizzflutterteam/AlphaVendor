import 'dart:convert';
import 'package:alpha_work/View/AUTH/LOGIN/model/loginOtpModel.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
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
