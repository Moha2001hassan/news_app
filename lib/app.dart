import 'package:flutter/material.dart';
import 'package:news_app/presentation/pages/splash_screen.dart';
import 'package:news_app/presentation/theme/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColor.lightBlue
      ),
      home: const SplashScreen(),
    );
  }
}