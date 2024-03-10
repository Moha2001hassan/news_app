import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/app_rounded_button.dart';
import 'package:news_app/core/app_rounded_button_blur.dart';
import 'package:news_app/core/utils/app_date_formatters.dart';

import '../../../theme/app_colors.dart';

class SingleNewsItemHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final String category;
  final String imageAssetPath;
  final DateTime date;
  final double topPadding;
  @override
  final double maxExtent;
  @override
  final double minExtent;

  const SingleNewsItemHeaderDelegate({
    required this.maxExtent,
    required this.minExtent,
    required this.title,
    required this.category,
    required this.imageAssetPath,
    required this.date,
    required this.topPadding,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          imageAssetPath,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 0,
          child: SizedBox(
            width: screenWidth,
            child: Column(
              children: [
                SizedBox(height: topPadding),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    AppRoundedButtonBlur(
                      iconData: CupertinoIcons.left_chevron,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    AppRoundedButtonBlur(
                      iconData: CupertinoIcons.bookmark,
                      onTap: () {},
                    ),
                    const SizedBox(width: 10),
                    AppRoundedButtonBlur(
                      iconData: Icons.more_horiz,
                      onTap: () {},
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
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
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  label: Text(
                    category,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 35,
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  AppDateFormatters.myY(date),
                  style: const TextStyle(color: Colors.white70),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
