import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for navigation
import '../../custome_widgets/custome_btn.dart';
import '../../utilis/Constants/app_colors.dart';
import '../../utilis/Constants/app_images.dart';
import '../../utilis/Constants/app_texts.dart';
import '../home_screen/home_screen.dart';
import '../signup_screen/signup_screen.dart' show SignupScreen;


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  // final _auth = FirebaseAuth.instance;



  bool passToggle = true;
  bool get _isFormValid => _formKey.currentState?.validate() ?? false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 100),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.mainLogo,
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(height: 10),

                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Welcome To Mental Health ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Inter",
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Support App',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Inter",
                            letterSpacing: 1.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),

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
                    keyboardType: TextInputType.visiblePassword,
                    controller: passController,
                    obscureText: passToggle,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
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
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  CustomeButton(
                    text: AppText.logIn,
                    color1: AppColors.lightGreenBtn,
                    color2: AppColors.greenBtn,
                    tap: () {
                      if (_formKey.currentState!.validate()) {
                        Get.offAll(() => const HomeScreen()); //
                      }
                    },
                  ),
               SizedBox( height: 20),
                  Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("Don't have an account?"),
                   TextButton(
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => SignupScreen(),
                         ),
                       );
                     },
                     child: Text('Sign up ' ,style:  TextStyle(fontSize: 19 ,color: Colors.black ),),
                   ),

                 ],
               ),
                  const Spacer(),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 4,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
