import 'package:flutter/material.dart';

import '../../../utilis/Constants/app_texts.dart';

Widget InfoContainer(
    {final String text = AppText.feelingToday,
    final double height = 67,
   // final double width = 290,
    final Color color = const Color(0xffFFFFFF)}) {
  return Container(
    height: height,
   // width: width,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(offset: Offset(0, 2), spreadRadius: 0, blurRadius: 4)
        ]),
    child: Center(
        child: Text(
      text,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800,fontFamily: "Inter"),
    )),
  );
}
