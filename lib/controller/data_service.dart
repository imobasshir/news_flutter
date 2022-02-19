import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class DataService {
  Future<NewsModel> fetchNewsList(String info, String ctry) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=$ctry&category=$info&pageSize=60&apiKey=71de2801cfaf4f53a09c73b0f9eec2a3";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // print(response.body);
      return NewsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load users');
    }
  }
}