import 'package:flutter/material.dart';

import '../../../utilis/Constants/app_texts.dart';
import '../model/history_model/history_model.dart';

Widget HistoryContainer(
    {final String text = AppText.feelingToday,
    final double height = 80,
    //final double width = 290,
    final String time = AppText.feelingToday,
    final String mood = AppText.feelingToday,
    final String image = AppText.feelingToday,
    final Color color = const Color(0xffFFFFFF)}) {
  final historyItem = HistoryDetail();

  return Expanded(
    child: ListView.builder(
      itemCount: historyItem.Items.length,
      // physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                  height: height,
                  //width: width,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                            blurRadius: 4)
                      ]),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        historyItem.Items[index].image,
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
                            historyItem.Items[index].date,
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            historyItem.Items[index].mood,
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 13,
                                color: historyItem.Items[index].color,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(historyItem.Items[index].time),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        );
      },
    ),
  );
}
