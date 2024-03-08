import 'package:flutter/material.dart';

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
    return Row(
      children: [
        Image.network(imageAssetPath),
      ],
    );
  }
}





