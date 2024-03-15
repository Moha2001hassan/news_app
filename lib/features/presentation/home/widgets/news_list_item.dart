import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_date_formatters.dart';
import '../pages/single_news_item_page.dart';

class NewsListItem extends StatefulWidget {
  final String title;
  final String content;
  final String author;
  final String publisher;
  final String imageUrl;
  final DateTime date;

  const NewsListItem(
      {super.key,
      required this.title,
      required this.author,
      required this.publisher,
      required this.imageUrl,
      required this.date,
      required this.content});

  @override
  State<NewsListItem> createState() => _NewsListItemState();
}

class _NewsListItemState extends State<NewsListItem> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _checkSavedState();
  }

  void _checkSavedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool saved = prefs.getBool(widget.title) ?? false;
    setState(() {
      isSaved = saved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleNewsItemPage(
                    title: widget.title,
                    content: widget.content,
                    author: widget.author,
                    publisher: widget.publisher,
                    imageAssetPath: widget.imageUrl,
                    date: widget.date)));
      },
      child: Card(
        elevation: 5,
        surfaceTintColor: AppColor.white,
        child: SizedBox(
          height: 145,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                  width: 135,
                  height: 135,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(widget.imageUrl,
                          width: 135, height: 135, fit: BoxFit.cover))),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(children: [
                      SizedBox(
                          width: 150,
                          child: Text(widget.publisher,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.darkGray),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis)),
                      const Spacer(),
                      IconButton(
                          icon: isSaved
                              ? const Icon(Icons.bookmark)
                              : const Icon(Icons.bookmark_outline),
                          onPressed: () {
                            _toggleSaved();
                          })
                    ]),
                    Text(widget.title,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 5),
                    Text(
                      AppDateFormatters.myY(widget.date),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColor.darkGray,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleSaved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSaved = !isSaved;
    });

    if (isSaved) {
      String itemJson = jsonEncode({
        'title': widget.title,
        'author': widget.author,
        'publisher': widget.publisher,
        'imageUrl': widget.imageUrl,
        'date': widget.date.toIso8601String(), // Convert DateTime to string
        'content': widget.content
      });
      // Save the JSON string
      prefs.setString(widget.title, itemJson);
      print('Article saved');
    } else {
      // Remove the saved item
      prefs.remove(widget.title);
      print('Article removed from saved');
    }
  }
}
