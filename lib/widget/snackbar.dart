import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

void showCustomSnackbar({
  required String title,
  required String message,
  required Color backgroundColor,
  IconData? icon,
}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor,
    colorText: Colors.white,
    borderRadius: 8,
    margin: EdgeInsets.all(10),
    icon: Icon(icon ?? Icons.info, color: Colors.white),
    titleText: Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    messageText: Text(
      message,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
