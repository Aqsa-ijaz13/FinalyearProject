

import '../../../../utilis/Constants/app_colors.dart';
import '../../../../utilis/Constants/app_images.dart';
import '../../../../utilis/Constants/app_texts.dart';
import 'emoji_info.dart';

class EmojiItem{

  List<EmojiInfo> Items =[
    EmojiInfo(
      text: AppText.cry,
      image: AppImages.cryLogo,
      color: AppColors.blue,
    ),
    EmojiInfo(
      text: AppText.happy,
      image: AppImages.happyLogo,
      color: AppColors.yellow,

    ),
    EmojiInfo(
      text: AppText.sad,
      image: AppImages.sadLogo,
      color: AppColors.darkBlue,

    ),
    EmojiInfo(
      text: AppText.awful,
      image: AppImages.awfulLogo,
      color: AppColors.greenBtn
      ,
    ),
    EmojiInfo(
      text: AppText.bad,
      image: AppImages.badLogo,
      color: AppColors.red,
    ),

  ];
}