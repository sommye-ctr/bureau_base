import 'package:bureau_base/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Style {
  static const Color primaryColor = Color(0xFFA2D2FF);

  static double largeRoundEdgeRadius = 16;
  static double smallRoundEdgeRadius = 8;

  static void showToast({
    required BuildContext context,
    required String text,
    bool long = false,
  }) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: long ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }

  static String getDayMonthYear({required DateTime date}) {
    return "${date.day} ${Constants.months[date.month - 1]} ${date.year}";
  }
}
