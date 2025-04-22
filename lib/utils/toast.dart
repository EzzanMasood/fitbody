import 'package:fitbody/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showToast({
    required String message,
    Toast? toastLength = Toast.LENGTH_SHORT,
    ToastGravity? gravity = ToastGravity.BOTTOM,
    Color? backgroundColor = AppColors.backgroundColor,
    Color? textColor = AppColors.yellow,
    double? fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}
