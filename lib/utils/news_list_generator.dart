import 'package:flutter/material.dart';
import '../presentation/widgets/news_list_item.dart';

class NewsListGenerator extends StatelessWidget {
  final List<Map<String, dynamic>> newsList;

  const NewsListGenerator({
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
          publisher: newsItem['source']['name'].toString(),
          imageUrl: newsItem['urlToImage'].toString(),
          url: newsItem['url'].toString(),
          date: DateTime.parse(newsItem['publishedAt'].toString()),
        );
      },
    );
  }
}
