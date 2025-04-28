

import '../../../../utilis/Constants/app_colors.dart';
import '../../../../utilis/Constants/app_images.dart';
import '../../../../utilis/Constants/app_texts.dart';
import 'history_info.dart';


class HistoryDetail{

  List<HistoryInfo> Items =[
    HistoryInfo(
      date: AppText.nov13,
      mood: AppText.happy,
      time: AppText.am7,
      image: AppImages.happyLogo,
      color: AppColors.yellow,
    ),
    HistoryInfo(
      date: AppText.nov12,
      mood: AppText.bad,
      time: AppText.am7,
      image: AppImages.badLogo,
      color: AppColors.red,
    ),
    HistoryInfo(
      date: AppText.nov11,
      mood: AppText.cry,
      time: AppText.am7,
      image: AppImages.cryLogo,
      color: AppColors.blue,
    ),
    HistoryInfo(
      date: AppText.nov10,
      mood: AppText.sad,
      time: AppText.am7,
      image: AppImages.sadLogo,
      color: AppColors.darkBlue,
    ),
    HistoryInfo(
      date: AppText.nov9,
      mood: AppText.awful,
      time: AppText.am7,
      image: AppImages.awfulLogo,
      color: AppColors.darkGreen,
    ),

  ];
}