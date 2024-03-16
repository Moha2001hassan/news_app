import 'package:flutter/material.dart';
import 'package:news_app/presentation/main_page.dart';
import 'package:news_app/presentation/theme/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: AppColor.azureRadianceSwatch,
        primaryColor: AppColor.lightBlue
      ),
      home: const MainPage(),
    );
  }
}