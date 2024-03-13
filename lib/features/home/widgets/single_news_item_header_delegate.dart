import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_date_formatters.dart';
import '../../../theme/app_colors.dart';
import 'item_top_blur_buttons.dart';

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
    const animationDuration = Duration(milliseconds: 200);
    final showCategoryDate = shrinkOffset < 100;

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
                const ItemTopBlurButtons(),
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
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedSwitcher(
                  duration: animationDuration,
                  child: showCategoryDate
                      ? Chip(
                          label: Text(
                            category,
                            style: const TextStyle(color: AppColor.white),
                          ),
                          backgroundColor: AppColor.lightBlue,
                        )
                      : const SizedBox.shrink(),
                ),
                AnimatedContainer(
                  duration: animationDuration,
                  height: showCategoryDate ? 10 : 0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 35,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 26,
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                AnimatedContainer(
                  duration: animationDuration,
                  height: showCategoryDate ? 10 : 0,
                ),
                AnimatedSwitcher(
                  duration: animationDuration,
                  child: showCategoryDate
                      ? Text(
                          AppDateFormatters.myY(date),
                          style: const TextStyle(color: Colors.white70),
                        )
                      : const SizedBox.shrink(),
                ),
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
