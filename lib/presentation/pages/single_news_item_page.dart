import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/news_item_header.dart';

class SingleNewsItemPage extends StatelessWidget {
  final String title;
  final String content;
  final String author;
  final String publisher;
  final String url;
  final String imageAssetPath;
  final DateTime date;

  const SingleNewsItemPage({
    super.key,
    required this.title,
    required this.content,
    required this.author,
    required this.publisher,
    required this.imageAssetPath,
    required this.date,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final maxScreenSizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.black,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SingleNewsItemHeaderDelegate(
                maxExtent: maxScreenSizeHeight / 2,
                minExtent: topPadding + 56,
                title: title,
                category: publisher,
                imageAssetPath: imageAssetPath,
                date: date,
                topPadding: topPadding,
                url: url,
                publisher: publisher),
          ),
          SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        textAlign: TextAlign.center,
                        author,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 10),
                    Text(
                      content * 4,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
