import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final String text;
  final double height;
  final Color textColor;
  final Color color1;
  final Color color2;
  final VoidCallback? tap;

  const CustomeButton({
    Key? key,
    required this.text,
    this.height = 50,
    this.textColor = const Color(0xffFFFFFF),
    this.color1 = const Color(0xffBEBAF2),
    this.color2 = const Color(0xff3B3772),
    this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
          ),
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 1), spreadRadius: 0, blurRadius: 2),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
