import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/images/provider/images_provider.dart';
import 'package:flutter_assessment_task/popular/provider/popular_provider.dart';
import 'package:flutter_assessment_task/popular_details/provider/person_details.dart';
import 'package:flutter_assessment_task/shared/di.dart';
import 'package:flutter_assessment_task/shared/style/global_colors.dart';
import 'package:flutter_assessment_task/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PopularPeopleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PopularDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileImagesProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Task',
        navigatorKey: navigatorKey,
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
