import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fyp/utilis/Constants/app_colors.dart';
import 'package:fyp/view/home_screen/home_screen.dart';
import 'package:fyp/widget/snackbar.dart';
import 'package:get/get.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  bool _isVisibility = false;
  bool get isVisibility => _isVisibility;

  void visibility() {
    _isVisibility = !_isVisibility;
    notifyListeners();
  }

  Future<void> login() async {
    EasyLoading.show(status: "Login.....");
    try {
      auth
          .signInWithEmailAndPassword(
              email: emailController.text.trim().toString(),
              password: passwordController.text.trim().toString())
          .then((value) {
        EasyLoading.dismiss();
        showCustomSnackbar(
            title: "Welcome",
            message: "Login Successfully",
            backgroundColor: AppColors.darkGreen);
        Get.to(HomeScreen());
      }).onError((error, stackTrace) {
        EasyLoading.dismiss();
        showCustomSnackbar(
            title: "Oops",
            message: error.toString(),
            backgroundColor: AppColors.red);
      });
    } catch (e) {
      EasyLoading.dismiss();
      showCustomSnackbar(
          title: "Oops", message: e.toString(), backgroundColor: AppColors.red);
    }
  }
}
