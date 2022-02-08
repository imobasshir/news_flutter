import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsApiCall extends StatefulWidget {
  const NewsApiCall({Key? key}) : super(key: key);

  @override
  _NewsApiCallState createState() => _NewsApiCallState();
}

class _NewsApiCallState extends State<NewsApiCall> {
  Future<NewsModel> fetchNewsList() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=71de2801cfaf4f53a09c73b0f9eec2a3";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // print(response.body);
      return NewsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'News Headlines',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchNewsList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data.articles;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          title: Image.network(
                            data[index].urlToImage.toString(),
                            errorBuilder: (context, error, stackTrace) {
                              return const Text(
                                'Sorry No Image found',
                                textScaleFactor: 1.4,
                              );
                            },
                          ),
                          subtitle: Text(
                            data[index].title,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onTap: () {
                            launch(data[index].url);
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
