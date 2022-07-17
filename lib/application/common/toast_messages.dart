import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> showErrorToast(String message) async {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.redAccent,
    textColor: Colors.white,
    gravity: ToastGravity.CENTER,
  );
}

Future<void> showGoodToast(String message) async {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.greenAccent,
    textColor: Colors.black,
    gravity: ToastGravity.CENTER,
  );
}
