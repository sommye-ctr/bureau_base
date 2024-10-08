import 'package:awesome_dialog/awesome_dialog.dart';
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

  static void showLoadingDialog({
    required BuildContext context,
    String? text,
  }) {
    AwesomeDialog(
      context: context,
      autoDismiss: false,
      dismissOnBackKeyPress: false,
      dialogType: DialogType.noHeader,
      dialogBackgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: CircularProgressIndicator(),
          ),
          if (text != null)
            Text(
              text,
              textAlign: TextAlign.center,
            ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      useRootNavigator: true,
      onDismissCallback: (DismissType type) {},
    ).show();
  }

  static void dismissLoadingDialog({
    required BuildContext context,
  }) {
    Navigator.pop(context);
  }
}
