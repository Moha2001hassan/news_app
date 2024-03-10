import 'package:flutter/material.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/features/home/widgets/news_list_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          if (i < newsItems.length) {
            return NewsListItem(
              title: newsItems[i]['title'].toString(),
              author: newsItems[i]['author'].toString(),
              category: newsItems[i]['source']!['name'].toString(),
              authorImageAssetPath: newsItems[i]['urlToImage'].toString(),
              imageAssetPath: newsItems[i]['urlToImage'].toString(),
              date: DateTime.parse(newsItems[i]['publishedAt'].toString()),
              content: newsItems[i]['content'].toString(),
            );
          } else {
            return null; // or any other handling you prefer for out-of-range indices
          }
        },
      ),
    );
  }
}
