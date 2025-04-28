import 'package:flutter/material.dart';

import '../../utilis/Constants/app_colors.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.background1,
              AppColors.background2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              // Main Gradient Circle with Text
              Container(
                width: 275, // Outer circle size
                height: 275,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.purpleAccent, Colors.pinkAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 150, // Inner circle size
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.purpleAccent, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(
                        color: Colors.white, // White outline
                        width: 3, // Border thickness
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Inhale\nNose',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Length Selector
                    Text(
                      'LENGTH',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (String time in ['1 min', '3 min', '5 min', '10 min'])
                          _TimeOption(text: time, isSelected: time == '5 min'),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Breath Type Selector
                    Text(
                      'BREATH TYPE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _BreathTypeOption(text: 'Normal', isSelected: true),
                        _BreathTypeOption(text: 'Easier', isSelected: false),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimeOption extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _TimeOption({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF9BECC4) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)]
            : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class _BreathTypeOption extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _BreathTypeOption({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF9BECC4) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)]
            : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
