import 'package:flutter/material.dart';
import 'package:news_app/theme/app_colors.dart';
import '../../../core/api/news_api_service.dart';
import '../widgets/category_news_list.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin {
  List<dynamic> articles = [];

  late TabController _tabController;
  List<String> newsCategories = ['politics', 'football', 'health', 'technology'];
  String selectedTabContent = 'politics';

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Politics'),
    const Tab(text: 'Sports'),
    const Tab(text: 'Health'),
    const Tab(text: 'Technology')
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
    _tabController.addListener(_updateSelectedTabContent);

    fetchNews(selectedTabContent).then((news) {
      setState(() {
        articles = news;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
                controller: _tabController,
                tabs: myTabs,
                dividerColor: AppColor.darkGray,
                indicatorColor: AppColor.lightBlue,
                labelColor: AppColor.lightBlue,
                onTap: (index) {
                  // Fetch news articles when the user switches tabs
                  fetchNews(newsCategories[index]).then((news) {
                    setState(() {
                      articles = news.cast<Map<String, dynamic>>();
                    });
                  });
                }),
            Expanded(
              child: CategoryNewsList(
                  newsList: articles.cast<Map<String, dynamic>>()),
            )
          ],
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
