import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_date_formatters.dart';
import 'package:news_app/theme/app_colors.dart';

class HomeSliderItem extends StatelessWidget {
  final bool isActive;
  final String imageAssetsPath;
  final String category;
  final String title;
  final String author;
  final DateTime date;

  const HomeSliderItem({
    super.key,
    required this.isActive,
    required this.imageAssetsPath,
    required this.category,
    required this.title,
    required this.author,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.08,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 400),
        scale: isActive ? 1 : 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                color: Colors.blue,
              ),
              Image.network(
                imageAssetsPath,
                fit: BoxFit.cover,
                height: double.maxFinite,
                width: double.maxFinite,
              ),
              Positioned(
                left: 10,
                top: 7,
                child: Chip(
                  label: Text(
                    category,
                    style: const TextStyle(color: AppColor.white),
                  ),
                  backgroundColor: AppColor.azureRadiance,
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.black08,
                      AppColor.black06,
                      AppColor.black00,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "$author  ${AppDateFormatters.myY(date)}",
                      style: const TextStyle(fontSize: 15, color: AppColor.white),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, color: AppColor.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
