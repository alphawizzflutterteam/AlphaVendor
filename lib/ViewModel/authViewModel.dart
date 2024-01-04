// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:math';

import 'package:alpha_work/Utils/appUrls.dart';
import 'package:alpha_work/Utils/color.dart';
import 'package:alpha_work/Utils/shared_pref..dart';
import 'package:alpha_work/Utils/utils.dart';
import 'package:alpha_work/View/AUTH/LOGIN/otpfind.dart';

import 'package:alpha_work/View/Dashboard/Dashboad.dart';
import 'package:alpha_work/repository/authRepository.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:crypto/crypto.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  String? mobileNumber, password;
  String? name, countryCode, signUpPassword, signUpEmail;
  String? newPassword;

  bool? error;
  String errorMessage = '';

  bool isLoading = false;

  bool get loading => isLoading;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  bool isLoggingViaPhone = true;

  bool get loggingViaPhone => isLoggingViaPhone;

  setLoggingViaPhone(bool value) {
    isLoggingViaPhone = value;
    notifyListeners();
  }

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  final Random _rnd = Random();
  int count = 1;
  get mobileNumberValue => mobileNumber;

  setMobileNumber(String? value) {
    mobileNumber = value;
    notifyListeners();
  }

  setNewPassword(String? value) {
    newPassword = value;
    notifyListeners();
  }

  setSignUp(String? value) {
    signUpEmail = value;
    notifyListeners();
  }

  setSignUpPassword(String? value) {
    signUpPassword = value;
    notifyListeners();
  }

  setCountryCode(String? value) {
    countryCode = value;
    notifyListeners();
  }

  setUserName(String? value) {
    name = value;
    notifyListeners();
  }

  setPassword(String? value) {
    password = value;
    notifyListeners();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  String getRandomString(int length) => String.fromCharCodes(
        Iterable.generate(
          length,
          (_) => _chars.codeUnitAt(
            _rnd.nextInt(
              _chars.length,
            ),
          ),
        ),
      );

  Future<void> loginwithPhone({
    required String phone,
    required BuildContext context,
  }) async {
    await _myRepo
        .loginOtpPostRequest(api: AppUrl.loginOtp, phone: phone)
        .then((value) async {
      setLoading(false);
      print(value.token);
      print(value.otp);
      Fluttertoast.showToast(
          msg: value.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: colors.buttonColor,
          textColor: Colors.white,
          fontSize: 16.0);
      if (value.message == "OTP sent success") {
        PreferenceUtils.setString(PrefKeys.mobile, phone);
        PreferenceUtils.setString(PrefKeys.jwtToken, value.token.toString());
        PreferenceUtils.setString(PrefKeys.otp, value.otp.toString());
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OtpCheckPage(),
        ));
      }
    });
  }
}
