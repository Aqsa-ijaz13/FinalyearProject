import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utilis/Constants/app_colors.dart';
import '../../utilis/Constants/app_images.dart';
import '../../utilis/Constants/app_texts.dart';
import '../../widget/snackbar.dart';

class EmergencyContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.background1,
              AppColors.background2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header Section
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppImages.emergency,
                      height: 91.47,
                      width: 196.72,
                    ),
                    Positioned(
                      left: -30,
                      top: -19,
                      child: Image.asset(
                        AppImages.hour24,
                        height: 90.3,
                        width: 95,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Emergency Helpline Title
                Text(
                  AppText.helpLine,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Emergency Contacts Section
                _buildContactCard(
                  title: AppText.booking,
                  subtitle: AppText.response,
                  icon: Icons.phone,
                  color: AppColors.red,
                ),
                const SizedBox(height: 10),
                _buildContactCard(
                  title: AppText.backUp,
                  subtitle: AppText.response,
                  icon: Icons.phone,
                  color: AppColors.red,
                ),
                const SizedBox(height: 20),

                // Contact Cards for Clinics
                _buildContactCard(
                  title: AppText.pakYoung,
                  subtitle: '0341 0211366',
                  icon: Icons.phone,
                  color: AppColors.red,
                ),
                const SizedBox(height: 10),
                _buildContactCard(
                  title: AppText.dr,
                  subtitle: '(051) 4425533',
                  icon: Icons.phone,
                  color: AppColors.red,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build a contact card
  Widget _buildContactCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () async {
        String phoneNumber = 'tel:$subtitle';  // Ensure it's a 'tel:' URI
        if (await canLaunchUrl(Uri.parse(phoneNumber))) {
          await launchUrl(Uri.parse(phoneNumber));
        } else {
          showCustomSnackbar(
            title: "Error",
            message: "Could not launch phone app",
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
        }
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(icon, color: color, size: 30),
          title: Text(
            title,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: AppColors.black),
        ),
      ),
    );
  }
}
