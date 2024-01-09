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

//Function to login with phone
  Future<void> loginwithPhone({
    required String phone,
    required BuildContext context,
    required bool isPass,
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
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: colors.buttonColor,
          textColor: Colors.white,
          fontSize: 16.0);
      if (value.message == "OTP sent success") {
        PreferenceUtils.setString(PrefKeys.mobile, phone);
        PreferenceUtils.setString(PrefKeys.jwtToken, value.token.toString());
        PreferenceUtils.setString(PrefKeys.otp, value.otp.toString());
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OtpCheckPage(isPass: isPass),
        ));
      }
    });
  }

//Function to login with phone
  Future<bool> getRegistrarionOtp({
    required String phone,
  }) async {
    bool val = false;
    await _myRepo
        .registerOtpPostRequest(api: AppUrl.registerOtp, phone: phone)
        .then((value) async {
      setLoading(false);
      print(value.token);
      print(value.otp);
      Fluttertoast.showToast(
          msg: value.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: colors.buttonColor,
          textColor: Colors.white,
          fontSize: 16.0);
      if (value.message == "OTP sent success") {
        val = true;
        PreferenceUtils.setString(PrefKeys.otp, value.otp.toString());
      }
    });
    return val;
  }

//Function to register vendor
  Future<bool> registerUser({
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
    bool val = false;
    await _myRepo
        .registerVendorPostRequest(
      api: AppUrl.register,
      phone: phone,
      otp: otp,
      name: name,
      email: email,
      referalcode: referalcode,
      businessemail: businessemail,
      businessphoneNo: businessphoneNo,
      businessname: businessname,
      businessType: businessType,
      registrationNo: registrationNo,
      gstin: gstin,
      tin: tin,
      website: website,
      password: password,
      confirmPass: confirmPass,
      addr: addr,
      city: city,
      state: state,
      zip: zip,
      country: country,
      bankName: bankName,
      branch: branch,
      accType: accType,
      micr: micr,
      bankAddr: bankAddr,
      accNo: accNo,
      ifsc: ifsc,
    )
        .then((value) {
      val = value;
      setLoading(false);
    }).onError((error, stackTrace) => setLoading(false));
    return val;
  }
}
