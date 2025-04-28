import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custome_widgets/custome_btn.dart';
import '../../utilis/Constants/app_colors.dart';
import '../../utilis/Constants/app_images.dart';
import '../../utilis/Constants/app_texts.dart';
import '../login_screen/login_screen.dart';
import '../signup_screen/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.background1,
            AppColors.background2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            SizedBox(
              height: 220,
            ),
            Image.asset(
              AppImages.mainLogo,
              height: 65,
              width: 65,
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              AppText.mentalHealth,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Inter",
                  decoration: TextDecoration.none,
                  color: AppColors.black),
            ),
            SizedBox(
              height: 126,
            ),
            CustomeButton(
              tap: () {
                Get.to(() => SignupScreen());
              },
              color1: AppColors.lightPurpleBtn,
              color2: AppColors.purpleBtn,
              text: AppText.signUp,
            ),
            SizedBox(
              height: 25,
            ),
            CustomeButton(
              tap: () {
                Get.to(() => LoginScreen());
              },
              color1: AppColors.lightGreenBtn,
              color2: AppColors.greenBtn,
              text: AppText.logIn,
            ),
          ],
        ),
      ),
    );
  }
}
