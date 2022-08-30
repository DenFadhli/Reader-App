import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reader_app/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(205, 249, 255, 100),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/flat-color-icons_document.png',
                height: 300.0,
                width: 300.0,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Powered By Baladar",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 175, 175, 100),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
