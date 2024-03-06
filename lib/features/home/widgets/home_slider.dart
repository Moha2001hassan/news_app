import 'package:flutter/material.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/features/home/widgets/home_slider_item.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  late final PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1000);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _pageIndex = value % newsItems.length;
          });
        },
        itemBuilder: (context, index) {
          final i = index % newsItems.length;
          return HomeSliderItem(
            isActive: _pageIndex == i,
            imageAssetsPath: newsItems[i]['urlToImage'].toString(),
            category: newsItems[i]['author'].toString(),
            title: newsItems[i]['title'].toString(),
            author: newsItems[i]['author'].toString(),
            date: DateTime.parse(newsItems[i]['publishedAt'].toString()),
          );
        },
      ),
    );
  }
}
