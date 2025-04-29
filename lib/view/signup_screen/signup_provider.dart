import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fyp/utilis/Constants/app_colors.dart';
import 'package:fyp/view/login_screen/login_screen.dart';
import 'package:fyp/widget/snackbar.dart';
import 'package:get/get.dart';

class SignUpProvider with ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('users');

  bool _isVisibilty = false;
  bool get isVisibility => _isVisibilty;

  void visibility() {
    _isVisibilty = !_isVisibilty;
    notifyListeners();
  }

  Future<void> signUp() async {
    EasyLoading.show(status: "Registering......");
    try {
      auth
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((userCredential) async {
        await fireStore.doc(auth.currentUser!.uid).set({
          'userId': auth.currentUser!.uid,
          'userName': usernameController.text.trim().toString(),
          'email': emailController.text.trim().toString(),
          'createdAt': DateTime.now(),
        }).then((value) {
          EasyLoading.dismiss();
          showCustomSnackbar(
              title: "Welcome",
              message: "User Registered Successfully",
              backgroundColor: AppColors.darkGreen);
          Get.to(LoginScreen());
        }).onError((error, stackTrace) {
          EasyLoading.dismiss();
          showCustomSnackbar(
              title: "Oops",
              message: error.toString(),
              backgroundColor: AppColors.red);
        });
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
