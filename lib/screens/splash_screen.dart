import 'package:consultation_heating/constants.dart';
import 'package:flutter/material.dart';
import 'main_screen.dart'; // Replace with the actual import for your MainScreen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay of 3 seconds before navigating to MainScreen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainScreen(), // Replace with your MainScreen widget
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrayColor,
      body: Center(
        child: Image.asset(
          'assets/consultation_heating_logo.png',
          // Add any width and height constraints as needed
        ),
      ),
    );
  }
}
