import 'package:flutter/material.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/features/home/widgets/home_slider_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    return SliverList(
      delegate: SliverChildListDelegate([
        SizedBox(
          height: 235,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _pageIndex = value % sliderNewsList.length;
              });
            },
            itemBuilder: (context, index) {
              final i = index % sliderNewsList.length;
              return HomeSliderItem(
                isActive: _pageIndex == i,
                publisher: sliderNewsList[i]['source']['name'].toString(),
                title: sliderNewsList[i]['title'].toString(),
                author: sliderNewsList[i]['author'].toString(),
                date: DateTime.parse(sliderNewsList[i]['publishedAt'].toString()),
                content: sliderNewsList[i]['content'].toString(),
                imageAssetPath: sliderNewsList[i]['urlToImage'].toString(),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.maxFinite,
          alignment: AlignmentDirectional.center,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: sliderNewsList.length,
            effect: const ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
        ),
      ]),
    );
  }
}
