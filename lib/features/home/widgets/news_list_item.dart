import 'package:flutter/material.dart';
import 'package:news_app/theme/app_colors.dart';

import '../../../core/utils/app_date_formatters.dart';

class NewsListItem extends StatelessWidget {
  final String title;
  final String author;
  final String category;
  final String authorImageAssetPath;
  final String imageAssetPath;
  final DateTime date;

  const NewsListItem({
    super.key,
    required this.title,
    required this.author,
    required this.category,
    required this.authorImageAssetPath,
    required this.imageAssetPath,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageAssetPath,
              width: 135,
              height: 135,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.osloGray,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 11,
                      backgroundImage: NetworkImage(
                        authorImageAssetPath,
                      ),
                    ),
                    Text(
                      " $author . ${AppDateFormatters.myY(date)}",
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColor.osloGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
