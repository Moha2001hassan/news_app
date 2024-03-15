import 'package:flutter/material.dart';
import 'package:news_app/core/constants.dart';
import 'news_list_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          if (i < sliderNewsList.length) {
            return NewsListItem(
              title: sliderNewsList[i]['title'].toString(),
              author: sliderNewsList[i]['author'].toString(),
              publisher: sliderNewsList[i]['source']!['name'].toString(),
              imageUrl: sliderNewsList[i]['urlToImage'].toString(),
              date: DateTime.parse(sliderNewsList[i]['publishedAt'].toString()),
              content: sliderNewsList[i]['content'].toString(),
            );
          } else {
            return null; // or any other handling you prefer for out-of-range indices
          }
        },
      ),
    );
  }
}
