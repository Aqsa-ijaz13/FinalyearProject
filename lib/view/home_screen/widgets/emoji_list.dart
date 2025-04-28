import 'package:flutter/material.dart';
import '../model/emoji_model/emoji_model.dart';

Widget EmojiList({
  final double height = 62,
  //required VoidCallback Tap,
}) {
  final emojiItem = EmojiItem();

  return Container(
    height: height,
    child: ListView.builder(
      itemCount: emojiItem.Items.length,
      scrollDirection: Axis.horizontal,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: Image.asset(
                  emojiItem.Items[index].image,
                  height: 40,
                ),
              ),
              Text(
                emojiItem.Items[index].text,
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  color:  emojiItem.Items[index].color,

                ),
              )
            ],
          ),
        );
      },
    ),
  );
}
