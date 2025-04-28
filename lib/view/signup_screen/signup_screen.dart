import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custome_widgets/custome_btn.dart';
import '../../utilis/Constants/app_colors.dart';
import '../../utilis/Constants/app_images.dart';
import '../../utilis/Constants/app_texts.dart';
import '../home_screen/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FirebaseAuth _auth =FirebaseAuth.instance;
  bool passToggle = true;

  bool _isFormValid = false;

  void _validateForm() {
    setState(() {
      _isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  // FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.background1, AppColors.background2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 70),

                  // Center Logo + Text
                  Column(
                    children: [
                      Image.asset(
                        AppImages.mainLogo,
                        height: 60,
                        width: 60,
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Welcome To Mental Health ',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Inter",
                            color: Colors.black
                          ),
                          children: [
                            TextSpan(
                              text: 'Support App',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black ,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Inter",
                                letterSpacing: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Input Fields
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(hintText: AppText.userName,
                    border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.person),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                    onChanged: (value) => _validateForm(),

                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                          .hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Email',

                      prefixIcon: Icon(Icons.email),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: AppText.enterPass,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                    onChanged: (value) => _validateForm(),
                  ),
                  const SizedBox(height:  55),


                  // Signup Button
                  CustomeButton(
                    text: AppText.join,
                    color1: AppColors.lightGreenBtn,
                    color2: AppColors.greenBtn,
                    tap: _isFormValid
                        ? () {
                      if (_formKey.currentState!.validate()) {
                        _auth.createUserWithEmailAndPassword(email: emailController.text.toString(),
                             password: _passwordController.text.toString());

                        Get.to(() => const HomeScreen());
                      }
                    }
                        : null, // Disable button if form is invalid
                  ),

                  const Spacer(),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 4,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
