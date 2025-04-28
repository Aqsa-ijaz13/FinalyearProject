import 'package:flutter/material.dart';


import '../dailyaffairmation/DailyAffiarmation.dart';
import '../emergency contacts/EmergencyContacts.dart';
import '../history_screen/history_screen.dart';
import '../home_screen/home_screen.dart';
import '../talawat-e-quran/talwat-e-quran.dart';
import '../timer_screen/timer_screen.dart';

class FeatureScreen extends StatefulWidget {
  @override
  _FeatureScreenState createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  int _selectedIndex = 2;

  static const String home = 'Home';
  static const String dailyAffirmation = 'Daily Affirmations';
  static const String clamMusic = 'Clam Music';
  static const String breathingExercises = 'Breathing Exercises';
  static const String history = 'History';
  static const String emergencyContact = 'Emergency Contact';

  static final Color background1 = Color(0xffFFE1E1);
  static final Color background2 = Color(0xffC9D4AC);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [background1, background2],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Features',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                FeatureButton(
                  title: home,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  ),
                ),
                FeatureButton(
                  title: dailyAffirmation,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DailyAffirmationScreen()),
                  ),
                ),
                FeatureButton(
                  title: clamMusic,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TalwatEQuran()),
                  ),
                ),
                FeatureButton(
                  title: breathingExercises,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimerScreen()),
                  ),
                ),
                FeatureButton(
                  title: history,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryScreen()),
                  ),
                ),
                FeatureButton(
                  title: emergencyContact,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmergencyContactsScreen()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const FeatureButton({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black12),
            color: Colors.white.withOpacity(0.8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}