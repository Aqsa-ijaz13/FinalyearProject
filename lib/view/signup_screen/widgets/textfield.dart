import 'package:flutter/material.dart';

import '../../../utilis/Constants/app_colors.dart';


Widget TextFIeld({
  final String hintText = '',
  final double height = 50,
  // final double weight = 310,
  bool obscureText = false,
  //required final FormFieldValidator<String?> validator,
  //required final TextEditingController controller,
}) {
  return SizedBox(
    height: height,
    //width: weight,
    child: TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          helperStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            fontFamily: 'Montserrat',
            //  color: AppColors.secondaryColor
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: AppColors.purpleBtn,
              ))),
    ),
  );
}
