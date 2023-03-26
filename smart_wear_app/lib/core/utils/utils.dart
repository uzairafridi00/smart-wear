import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cherry_toast/cherry_toast.dart';

class Utils {
  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 14.0,
    ); // Remove the icon
  }

  // void toastInfoMessage(BuildContext context, String message) {
  //   CherryToast.success(title: Text(message)).show(context);
  // }

  // void cherryToastMessage(BuildContext context, String message) {
  //   CherryToast(
  //     icon: Icons.alarm_add,
  //     themeColor: Colors.black,
  //     title: Text(message),
  //     displayTitle: false,
  //     toastPosition: POSITION.BOTTOM,
  //     animationDuration: Duration(milliseconds: 1000),
  //     autoDismiss: true,
  //   ).show(context);
  // }

  static void fieldFocus(
      BuildContext context, FocusNode currentNode, FocusNode nextFocusNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }
}
