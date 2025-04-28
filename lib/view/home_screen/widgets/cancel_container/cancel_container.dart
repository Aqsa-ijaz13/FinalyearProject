import 'package:flutter/material.dart';

Widget CancelContainer({
  final String text = '',
  final double height = 8,
  // final double weight = 310,
   final Color color = const Color(0xffA6A19D),
   required VoidCallback Tap,
}) {
  return GestureDetector(

    //onTap: Tap,
    child: Container(

      height: height,
      //   width: weight,
      child: Center(
          child: Icon(Icons.cancel_outlined,size: 20,color: color,),
      ),
    ),
  );
}
