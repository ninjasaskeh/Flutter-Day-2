import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/article.dart';

class Service {
  static Future<List<Article>> fetchArticles() async {
    const url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=0ad78af1c50144c2a186cb37d70caf39";
  final response = await http
      .get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final responseBody = jsonDecode(response.body);
    final result = responseBody['articles'] as List;
    final ListArticle = result.map((json) => Article.fromJson(json)).toList();
    return ListArticle;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
}