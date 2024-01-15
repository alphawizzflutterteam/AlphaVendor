import 'package:alpha_work/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static showTost({required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      backgroundColor: colors.buttonColor,
      fontSize: 14,
    );
  }
}
