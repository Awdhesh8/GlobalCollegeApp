import 'dart:async';
import 'package:flutter/material.dart';
import '../onboding/onboding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to the next screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      // Navigate to the next screen (replace 'NextScreen()' with your actual screen)
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnbodingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo image
            Image.asset(
              'assets/logo/splash_screen_logo.png',
              width: 220, // Adjust the width as needed
              height: 220, // Adjust the height as needed
            ),
          ],
        ),
      ),
    );
  }
}
