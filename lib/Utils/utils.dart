import 'package:alpha_work/Utils/color.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static showFlushBarWithMessage(
      String title, String msg, BuildContext context) {
    Flushbar(
      // title: title,
      forwardAnimationCurve: Curves.decelerate,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(10),
      backgroundColor: colors.buttonColor,
      flushbarPosition: FlushbarPosition.TOP,
      reverseAnimationCurve: Curves.easeOutSine,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      positionOffset: 20,
      message: msg,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
