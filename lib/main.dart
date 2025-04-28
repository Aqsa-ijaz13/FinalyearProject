import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fyp/view/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'view/login_screen/login_screen.dart';
import 'view/signup_screen/signup_screen.dart';
import 'view/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mental Health Support App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/SplashScreen',
      getPages: [
        GetPage(name: '/SplashScreen', page: () => const SplashScreen()),
        GetPage(name: '/LoginScreen', page: () => const LoginScreen()),
        GetPage(name: '/SignupScreen', page: () => const SignupScreen()),
        GetPage(name: '/HomeScreen', page: () => const HomeScreen()),
      ],
    );
  }
}
