import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetSnackBar customGetSnackBar({
  required String title,
  required String message,
}) {
  return GetSnackBar(
    dismissDirection: DismissDirection.up,
    backgroundColor: Colors.red,
    padding: const EdgeInsets.all(10),
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 5),
    maxWidth: 500,
    margin: const EdgeInsets.all(10),
    titleText: Center(
      child: Text(title),
    ),
    messageText: Center(
      child: Text(message),
    ),
    isDismissible: true,
  );
}
