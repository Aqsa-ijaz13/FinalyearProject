import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

              // Start StreamBuilder here
              StreamBuilder<List<Map<String, String>>>(
                stream: Stream.value(affirmations), // Simple static stream
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            final url = data[index]['link']!;
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                              image: DecorationImage(
                                image: AssetImage(data[index]['image']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                              ),
                              child: Text(
                                data[index]['title']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Affirmations with images + links
const affirmations = [
  {
    'image': AppImages.mentalHealth,
    'title': 'Mental Health',
    'link': 'https://www.mentalhealthjournal.org/articles/mental-health-education-awareness-and-stigma-regarding-mental-illness-among-college-students.html'
  },
  {
    'image': AppImages.positive,
    'title': 'Positive Mindset',
    'link': 'https://www.verywellmind.com/what-is-positive-thinking-2794772'
  },
  {
    'image': AppImages.miracle,
    'title': 'Miracle Morning',
    'link': 'https://www.nbcnews.com/better/lifestyle/i-tried-miracle-morning-routine-month-here-s-what-happened-ncna981786'
  },
  {
    'image': AppImages.oldHand,
    'title': 'Manifest',
    'link': 'https://www.theguardian.com/lifeandstyle/2022/feb/03/my-life-completely-turned-around-is-manifesting-the-key-to-happiness-or-wishful-thinking'
  },
  {
    'image': AppImages.lovePic,
    'title': 'Love',
    'link': 'https://www.mqmentalhealth.org/how-can-love-affect-mental-health/'
  },
  {
    'image': AppImages.weightLose,
    'title': 'Weight Loss',
    'link': 'https://www.healio.com/news/primary-care/20230622/mental-health-and-weight-loss-how-losing-weight-can-impact-mental-health' // Add your link here
  },
  {
    'image': AppImages.self,
    'title': 'Self-Esteem',
    'link': 'https://pmc.ncbi.nlm.nih.gov/articles/PMC5747942/'
  },
  {
    'image': AppImages.motivate,
    'title': 'Motivation',
    'link': 'https://thebigsilence.com/blogs/share-your-silence/how-your-mental-health-impacts-your-motivation?srsltid=AfmBOor5APM4VSmUsZBjDMcxM7iLYP8LtEwWIVirs7DwZenzvoWuozx7'
  },
];
