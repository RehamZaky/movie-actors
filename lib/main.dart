import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/popular/provider/popular_people.dart';
import 'package:flutter_assessment_task/shared/style/global_colors.dart';
import 'package:flutter_assessment_task/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PopularPeople(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          iconTheme: const IconThemeData(color: GlobalColors.backgroundColor),
          scaffoldBackgroundColor: GlobalColors.primaryColor,
          fontFamily: 'Rancho-Regular',
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
