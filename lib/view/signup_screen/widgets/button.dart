import 'package:flutter/material.dart';

import '../../../utilis/Constants/app_colors.dart';

Widget Button({
  final String text = '',
  final double height = 50,
 // final double weight = 310,
  final Color textColor =const Color(0xffFFFFFF),
  final Color color1 = const Color(0xffBEBAF2),
  final Color color2 = const Color(0xff3B3772),
//  required VoidCallback Tap,
}) {
  return GestureDetector(

    //onTap: Tap,
    child: Container(
      height: height,
   //   width: weight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
         // Optional
        ),
        borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(offset: Offset(0, 1), spreadRadius: 0, blurRadius: 2)
          ]
      ),
      child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter'),
          )),
    ),
  );
}
