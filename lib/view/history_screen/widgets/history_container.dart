import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

import '../../../utilis/Constants/app_texts.dart';
import '../model/history_model/history_model.dart';

class HistoryContainer extends StatelessWidget {
  final String text;
  final double height;
  final String time;
  final String mood;
  final String image;
  final Color color;

  // Constructor with named parameters
  const HistoryContainer({
    this.text = AppText.feelingToday,
    this.height = 80,
    this.time = AppText.feelingToday,
    this.mood = AppText.feelingToday,
    this.image = AppText.feelingToday,
    this.color = const Color(0xffFFFFFF),
  });

  // Mapping of feelings to image paths
  static const Map<String, String> feelingImageMap = {
    'awful': 'assets/images/awful_logo.png',
    'bad': 'assets/images/bad_logo.png',
    'cry': 'assets/images/cry_logo.png',
    'happy': 'assets/images/happy_logo.png',
    'sad': 'assets/images/sad_logo.png',
  };

  @override
  Widget build(BuildContext context) {
    final fireStore = FirebaseFirestore.instance.collection("history");
    final auth = FirebaseAuth.instance.currentUser!.uid;

    return StreamBuilder(
      stream: fireStore.where('userId', isEqualTo: auth).snapshots(),
      builder: (context, snapshot) {
        return Expanded(
          child: ListView.builder(
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              final colorValue = snapshot.data?.docs[index].data()?['color'];
              final mycolor =
                  colorValue is int ? Color(colorValue) : Colors.black;

              final timestamp = snapshot.data?.docs[index]['createdAt'];
              String dateStr = 'Unknown date';
              String timeStr = 'Unknown time';

              // Check if timestamp exists and is valid
              if (timestamp != null && timestamp is Timestamp) {
                final dateTime = timestamp.toDate();
                dateStr = DateFormat('MMMM d').format(dateTime); // "May 13"
                timeStr = TimeOfDay.fromDateTime(dateTime).format(context);
              }

              // Retrieve the feeling value
              final feeling = snapshot.data?.docs[index]['feeling'] ?? 'Unknown';
              // Get the corresponding image based on feeling
              final imagePath = feelingImageMap[feeling.toLowerCase()] ?? 'assets/images/default_logo.png';

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: height,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          // Display the image based on the feeling
                          Image.asset(
                            imagePath,
                            height: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dateStr,
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                feeling,
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 13,
                                  color: mycolor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(timeStr),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
