/*
{
  "status": "ok",
  "totalResults": 38,
  "articles": [
    {
      "source": {
        "name": "NDTV News"
      },
      "title": "Tweet - NDTV",
      "author": null,
      "description": "",
      "url": "",
      "urlToImage": "",
      "publishedAt": "2022-02-06T17:18:08Z",
    },
  ]
}
*/

// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

// To parse this JSON data, do
//
//     final News = NewsFromJson(jsonString);

// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);
import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
      };

  //   Map toJson() {
  //   final Map data = <dynamic, dynamic>{};
  //   data['status'] = status;
  //   data['totalResults'] = totalResults;
  //   data['articles'] = articles.map((v) => v.toJson()).toList();
  //   return data;
  // }
}

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  final Source? source;
  final dynamic author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
      };

  //   Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['source'] = source.toJson();
  //   data['author'] = author;
  //   data['title'] = title;
  //   data['description'] = description;
  //   data['url'] = url;
  //   data['urlToImage'] = urlToImage;
  //   data['publishedAt'] = publishedAt;
  //   return data;
  // }
}

class Source {
  Source({
    required this.name,
  });

  final String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };

  // Map<String, dynamic> toJson() {
  // final Map<String, dynamic> data = {};
  // data['name'] = name;
  // return data;
  // }
}
