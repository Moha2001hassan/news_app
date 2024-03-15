import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home/widgets/news_list_item.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  bool isSaved = true;
  List<Map<String, dynamic>> savedArticles = [];

  @override
  void initState() {
    super.initState();
    _loadSavedArticles();
    print(savedArticles);
  }

  void _loadSavedArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedKeys = prefs.getKeys().toList();
    List<Map<String, dynamic>> items = [];
    for (String key in savedKeys) {
      String itemJson = prefs.getString(key)!;
      Map<String, dynamic> item = jsonDecode(itemJson);
      items.add(item);
    }
    setState(() {
      savedArticles = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: _buildBookmarksList(),
    );
  }

  Widget _buildBookmarksList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: savedArticles.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> item = savedArticles[index];
          print(item['title']+"_______");
          print(item['content']+"_______");
          print(item['author']+"_______");

          return NewsListItem(
            title: item['title'],
            content: item['content'],
            author: item['author'],
            publisher: item['publisher'],
            imageUrl: item['imageUrl'],
            date: DateTime.parse(item['date']),
          );
        },
      ),
    );
  }
}
