import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/popular/screens/popular.dart';
import 'package:flutter_assessment_task/shared/style/global_colors.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MoviePopularScreen(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      body: Center(child: Lottie.asset('assets/lottie/splash.json')),
    );
  }
}
