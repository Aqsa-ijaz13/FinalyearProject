import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _phaseTimer;
  Timer? _sessionTimer;

  String _breathText = "Ready?";
  bool _isSessionRunning = false;
  int _selectedMinutes = 5; // Default 5 minutes
  final List<int> _timeOptions = [1, 3, 5, 10];

  final List<String> _breathPhases = ["Inhale", "Hold", "Exhale"];
  int _currentPhaseIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // breathing cycle
    );
    _animation = Tween<double>(begin: 0.7, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    _phaseTimer?.cancel();
    _sessionTimer?.cancel();
    super.dispose();
  }

  void startSession() {
    setState(() {
      _isSessionRunning = true;
      _currentPhaseIndex = 0;
      _breathText = _breathPhases[_currentPhaseIndex];
    });

    _controller.repeat(reverse: true);

    // Phase timer (changes text inhale → hold → exhale)
    _phaseTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _currentPhaseIndex = (_currentPhaseIndex + 1) % _breathPhases.length;
        _breathText = _breathPhases[_currentPhaseIndex];
      });
    });

    // Session timer (total minutes)
    _sessionTimer = Timer(Duration(minutes: _selectedMinutes), () {
      stopSession();
    });
  }

  void stopSession() {
    _controller.stop();
    _phaseTimer?.cancel();
    _sessionTimer?.cancel();
    setState(() {
      _isSessionRunning = false;
      _breathText = "Done!";
    });
  }

  void selectMinutes(int minutes) {
    setState(() {
      _selectedMinutes = minutes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height, // ⭐ Added height to fill screen ⭐
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffFFE1E1), Color(0xffC9D4AC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Breathing Exercise',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.purpleAccent, Colors.pinkAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          _breathText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              if (!_isSessionRunning) ...[
                const Text(
                  'Select Duration',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _timeOptions.map((time) {
                    return GestureDetector(
                      onTap: () => selectMinutes(time),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: _selectedMinutes == time ? Colors.green : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '$time min',
                          style: TextStyle(
                            color: _selectedMinutes == time ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: startSession,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Start',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
