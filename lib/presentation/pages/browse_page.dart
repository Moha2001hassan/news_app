import 'package:flutter/material.dart';
import '../../data/source/news_api_service.dart';
import '../../utils/news_list_generator.dart';
import '../widgets/browse_screen_header.dart';
import '../widgets/search_bar.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  List<dynamic> articles = [];
  String searchQuery = "Egypt";

  @override
  void initState() {
    super.initState();
    fetchNews(searchQuery).then((news) {
      setState(() {
        articles = news;
      });
    });
  }

  void searchNews(String query) {
    setState(() {
      searchQuery = query;
    });
    fetchNews(query).then((news) {
      setState(() {
        articles = news;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrowseScreenHeader(),
              SearchBarTextField(onSearch: searchNews),
              Expanded(
                child: NewsListGenerator(
                  newsList: articles.cast<Map<String, dynamic>>(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
