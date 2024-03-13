import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';

Future<List<dynamic>> fetchNews(String query) async {
  String apiUrl =
      '${Constants.BASE_URL}everything?q=$query&apiKey=${Constants.API_KEY}&pageSize=20';

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> articles = jsonDecode(response.body)['articles'];
      return articles.where((article) => article['urlToImage'] != null).toList();
    } else {
      throw Exception('Failed to load news');
    }
  } catch (e) {
    print(e);
    return [];
  }
}
