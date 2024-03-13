import 'package:flutter/material.dart';
import 'package:news_app/core/api/news_api_service.dart';
import '../widgets/browse_screen_header.dart';
import '../../categories/widgets/category_news_list.dart';
import '../widgets/search_bar.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage>
    with SingleTickerProviderStateMixin {
  List<dynamic> articles = [];

  @override
  void initState() {
    super.initState();

    fetchNews("Egypt").then((news) {
      setState(() {
        articles = news;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrowseScreenHeader(),
              const SearchBarTextField(),
              Expanded(
                child: CategoryNewsList(
                    newsList: articles.cast<Map<String, dynamic>>()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
