import 'package:flutter/material.dart';
import 'package:news_app/core/api/news_api_service.dart';
import '../widgets/browse_screen_header.dart';
import '../widgets/category_news_list.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage>
    with SingleTickerProviderStateMixin {
  List<dynamic> articles = [];

  late TabController _tabController;
  List<String> newsCategories = ['sports', 'politics', 'health', 'technology'];
  String selectedTabContent = 'sports';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_updateSelectedTabContent);

    fetchNews().then((news) {
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
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Sports'),
                  Tab(text: 'Politics'),
                  Tab(text: 'Health'),
                  Tab(text: 'Technology'),
                ],
              ),
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

  void _updateSelectedTabContent() {
    setState(() {
      selectedTabContent = newsCategories[_tabController.index];
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
