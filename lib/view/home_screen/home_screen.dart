import 'package:flutter/material.dart';
import 'package:fyp/view/home_screen/widgets/emoji_list.dart';
import 'package:fyp/view/home_screen/widgets/info_container.dart';
import 'package:get/get.dart';
import '../../custome_widgets/custome_btn.dart' show CustomeButton;
import '../../utilis/Constants/app_images.dart';
import '../../utilis/Constants/app_texts.dart';
import '../ProfileScreen/profilescreen.dart';
import '../featurescreen/featurescreen.dart';
import '../history_screen/history_screen.dart';
import '../timer_screen/timer_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeContent(),
    TimerScreen(),
    FeatureScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedIndex], // Yeh selected screen show karega
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.purple, // Active item ka color
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'Timer',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list),
              label: 'feature',
            ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',

            ),
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.background1,
            AppColors.background2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 37, right: 37, bottom: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(AppImages.girlPic, height: 112),
                InfoContainer(),
              ],
            ),
            EmojiList(),
            CustomeButton(
              text: AppText.chatAi,
              color1: Colors.deepPurpleAccent ,
              color2: Colors.lightGreen,
              tap: () {
                Get.to(() => HistoryScreen());
              },
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(AppImages.boyPic, height: 120),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
