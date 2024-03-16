import 'package:flutter/material.dart';
import 'package:news_app/utils/app_date_formatters.dart';
import 'package:news_app/presentation/theme/app_colors.dart';
import '../../../../presentation/pages/single_news_item_page.dart';

class HomeSliderItem extends StatelessWidget {
  final bool isActive;
  final String publisher;
  final String url;
  final String title;
  final String content;
  final String imageAssetPath;
  final String author;
  final DateTime date;

  const HomeSliderItem({
    super.key,
    required this.isActive,
    required this.publisher,
    required this.title,
    required this.author,
    required this.date,
    required this.content,
    required this.imageAssetPath,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleNewsItemPage(
                title: title,
                content: content,
                author: author,
                publisher: publisher,
                imageAssetPath: imageAssetPath,
                date: date,
                url: url),
          ),
        );
      },
      child: FractionallySizedBox(
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
                  color: AppColor.lightBlue,
                ),
                Image.network(
                  imageAssetPath,
                  fit: BoxFit.cover,
                  height: double.maxFinite,
                  width: double.maxFinite,
                ),
                Positioned(
                  left: 10,
                  top: 7,
                  child: Chip(
                    label: Text(
                      publisher,
                      style: const TextStyle(color: AppColor.white),
                    ),
                    backgroundColor: AppColor.lightBlue,
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
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColor.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        " ${AppDateFormatters.myY(date)} - $author",
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
