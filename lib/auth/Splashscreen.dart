import 'dart:async';
import 'package:app/auth/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Adding a delay of 3 seconds before navigating to LoginScreen
    Timer(const Duration(seconds: 3), () {
      // Navigate to the LoginScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent, // Background color for splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo or image for splash screen
            Image.asset(
              'assets/splash_logo.png', // Add your image path here
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            // App name or tagline
            Text('TripBudgeter',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    textStyle:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.w500))),
          ],
        ),
      ),
    );
  }
}
