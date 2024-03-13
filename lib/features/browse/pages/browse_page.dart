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
  List<String> tabContent = ['Tab 1 Content', 'Tab 2 Content', 'Tab 3 Content'];
  String selectedTabContent = 'Tab 1 Content';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrowseScreenHeader(),
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Tab 1'),
                  Tab(text: 'Tab 2'),
                  Tab(text: 'Tab 3'),
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
      selectedTabContent = tabContent[_tabController.index];
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
