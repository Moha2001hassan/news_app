import 'package:flutter/material.dart';
import 'package:news_app/features/home/widgets/home_heading.dart';
import 'package:news_app/features/home/widgets/home_slider.dart';
import 'package:news_app/features/home/widgets/home_top_buttons.dart';
import 'package:news_app/features/home/widgets/news_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: CustomScrollView(
            slivers: [
              const HomeTopButtons(),
              HomeHeading(
                title: "Breaking News",
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text("View all"),
                ),
              ),
              const HomeSlider(),
              HomeHeading(
                title: "Recommendation",
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text("View all"),
                ),
              ),
              const NewsList(),
            ],
          ),
        ),
      ),
    );
  }
}
