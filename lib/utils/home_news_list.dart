import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';
import '../presentation/widgets/news_list_item.dart';

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
              url: sliderNewsList[i]['url'].toString(),
              date: DateTime.parse(sliderNewsList[i]['publishedAt'].toString()),
              content: sliderNewsList[i]['content'].toString(),
            );
          } else {
            return null;
          }
        },
      ),
    );
  }
}
