import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/data_service.dart';
import '../model/model.dart';

class BusinessNews extends StatefulWidget {
  const BusinessNews({Key? key}) : super(key: key);

  @override
  _BusinessNewsState createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
  late Future<NewsModel> news;
  @override
  void initState() {
    super.initState();
    news = DataService().fetchNewsList('business', 'in');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: news,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data.articles;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(
                              data[index].urlToImage.toString(),
                              errorBuilder: (context, error, stackTrace) {
                                return const Text(
                                  'Sorry No Image found',
                                  textScaleFactor: 1.4,
                                  textAlign: TextAlign.center,
                                );
                              },
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              data[index].title,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onTap: () {
                            launch(
                              data[index].url,
                              forceWebView: true,
                              enableJavaScript: true,
                              forceSafariVC: true,
                            );
                          },
                        ),
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
    );
  }
}
