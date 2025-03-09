import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentFrame = 0;
  Timer? _timer;

  final List<String> frames = [
    "assets/img/Splash Screen (0).png",
    "assets/img/Splash Screen (1).png",
    "assets/img/Splash Screen (2).png",
    "assets/img/Splash Screen (3).png",
    "assets/img/Splash Screen (4).png",
    "assets/img/Splash Screen (5).png",
    "assets/img/Splash Screen (6).png"
  ];

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (!mounted) return;

      if (_currentFrame < frames.length - 1) {
        setState(() {
          _currentFrame++;
        });
      } else {
        _timer?.cancel();
        _navigateToRoleSelection();
      }
    });
  }

  void _navigateToRoleSelection() {
    if (mounted) {
      Navigator.pushReplacementNamed(context, "/roleSelection");
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: Image.asset(
            frames[_currentFrame],
            key: ValueKey<int>(_currentFrame),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
