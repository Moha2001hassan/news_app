import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebPage extends StatefulWidget {
  final String publisher;
  final String url;

  const NewsWebPage({super.key, required this.publisher, required this.url});

  @override
  State<NewsWebPage> createState() => _NewsWebPageState();
}

class _NewsWebPageState extends State<NewsWebPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.publisher),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
