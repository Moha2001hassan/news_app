import 'package:flutter/material.dart';
import 'package:news_app/theme/app_colors.dart';
import '../../../../core/api/news_api_service.dart';
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
  List<String> newsCategories = [
    'politics',
    'football',
    'health',
    'technology'
  ];
  String selectedTabContent = 'politics';

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Politics'),
    const Tab(text: 'Sports'),
    const Tab(text: 'Health'),
    const Tab(text: 'Tec')
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Categories Page",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.lightBlue,
                      ),
                      controller: _tabController,
                      tabs: myTabs,
                      labelColor: Colors.white,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 1),
                      onTap: (index) {
                        fetchNews(newsCategories[index]).then((news) {
                          setState(() {
                            articles = news.cast<Map<String, dynamic>>();
                          });
                        });
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CategoryNewsList(
                  newsList: articles.cast<Map<String, dynamic>>(),
                ),
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
