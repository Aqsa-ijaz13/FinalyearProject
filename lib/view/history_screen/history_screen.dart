import 'package:flutter/material.dart';
import 'package:fyp/view/history_screen/widgets/history_container.dart';
import '../../utilis/Constants/app_colors.dart';
import '../../utilis/Constants/app_texts.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.background1,
              AppColors.background2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight, // Optional
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 75,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90, right: 18),
              child: Row(
                children: [
                  Text(
                    '<',
                    style: TextStyle(
                        color: AppColors.lightPurpleBtn,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    AppText.history,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '>',
                    style: TextStyle(
                        color: AppColors.lightPurpleBtn,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter"),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                    color: AppColors.lightPurpleBtn,
                    size: 30,
                  )
                ],
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            HistoryContainer(),
          ],
        ),
      ),
    );
  }
}
