import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';

Future<List<dynamic>> fetchNews() async {
  const String apiUrl =
      '${Constants.BASE_URL}top-headlines?sources=techcrunch&apiKey=${Constants.API_KEY}';

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  } catch (e) {
    print(e);
    return [];
  }
}
