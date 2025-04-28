import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ProfileScreen()));
}

// Constants for Strings and Images
class AppAssets {
  static const String profile = 'assets/images/profile.png'; // Profile image
}

class AppStrings {
  static const String profile = 'My Profile';
  static const String firstname = 'First Name';
  static const String lastname = 'Last Name';
  static const String emailAddress = 'Email Address';
  static const String number = 'Phone Number';
}

// Colors for Gradient
class AppColors {
  static const Color background1 = Color(0xffFFE1E1); // Soft Pink
  static const Color background2 = Color(0xffC9D4AC); // Soft Green
}

// Main Profile Screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.background1, AppColors.background2],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                AppStrings.profile,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const ProfilePicture(),
              const SizedBox(height: 30),
              const CustomTextField(label: AppStrings.firstname),
              const CustomTextField(label: AppStrings.lastname),
              const CustomTextField(label: AppStrings.emailAddress),
              const CustomTextField(label: AppStrings.number),
            ],
          ),
        ),
      ),
    );
  }
}

// Profile Picture Widget
class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(AppAssets.profile),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Icon(Icons.camera_alt, size: 20),
        ),
      ],
    );
  }
}

// Custom TextField Widget
class CustomTextField extends StatelessWidget {
  final String label;
  const CustomTextField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
