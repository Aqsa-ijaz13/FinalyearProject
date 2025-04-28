import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../utilis/Constants/app_colors.dart';
import '../../utilis/Constants/app_images.dart';
import '../signup_screen/signup_screen.dart';
import '../welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
  
}
class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 2),
          () {
        Get.offAll(() => WelcomeScreen());
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.background1,
              AppColors.background2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight, // Optional
          ),
        ),
        child: Center(
          child: Image.asset(AppImages.mainLogo,height: 90,width: 90,)
        ),
      ),
    );;
  }
}
