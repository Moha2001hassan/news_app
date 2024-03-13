import 'package:flutter/material.dart';
import '../../home/widgets/news_list_item.dart';

class CategoryNewsList extends StatelessWidget {
  final List<Map<String, dynamic>> newsList;

  const CategoryNewsList({
    Key? key,
    required this.newsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        final newsItem = newsList[index];
        return NewsListItem(
          title: newsItem['title'].toString(),
          content: newsItem['content'].toString(),
          author: newsItem['author'].toString(),
          category: newsItem['source']['name'].toString(),
          imageUrl: newsItem['urlToImage'].toString(),
          date: DateTime.parse(newsItem['publishedAt'].toString()),
        );
      },
    );
  }
}
