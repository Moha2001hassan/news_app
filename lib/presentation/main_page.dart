import 'package:flutter/material.dart';
import 'pages/browse_page.dart';
import 'pages/categories_page.dart';
import 'pages/home_page.dart';
import 'widgets/bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        children: const [
          HomePage(),
          CategoriesPage(),
          BrowsePage(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _pageIndex,
        onTap: (value) {
          _pageController.jumpToPage(value);
        },
      ),
    );
  }
}
