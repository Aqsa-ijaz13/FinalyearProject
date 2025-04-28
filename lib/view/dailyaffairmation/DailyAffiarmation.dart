import 'package:flutter/material.dart';

import '../../utilis/Constants/app_colors.dart';
import '../../utilis/Constants/app_images.dart';



class DailyAffirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        backgroundColor: AppColors.background1,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Daily Affirmations',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Choose your favorite affirmation!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: affirmations.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                      image: DecorationImage(
                        image: AssetImage(affirmations[index]['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Text(
                        affirmations[index]['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Add a button to navigate to EmergencyContactsScreen

            ],
          ),
        ),
      ),
    );
  }
}

const affirmations = [
  {'image': AppImages.mentalHealth, 'title': 'Mental Health'},
  {'image': AppImages.positive, 'title': 'Positive Mindset'},
  {'image': AppImages.miracle, 'title': 'Miracle Morning'},
  {'image': AppImages.oldHand, 'title': 'Manifest'},
  {'image': AppImages.lovePic, 'title': 'Love'},
  {'image': AppImages.weightLose, 'title': 'Weight Loss'},
  {'image': AppImages.self, 'title': 'Self-Esteem'},
  {'image': AppImages.motivate, 'title': 'Motivation'},
];
