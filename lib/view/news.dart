import 'package:flutter/material.dart';
import 'package:news/view/business.dart';
import 'package:news/view/entertainment.dart';
import 'package:news/view/general.dart';
import 'package:news/view/sports.dart';
import 'package:news/view/tech.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  int _currentIndex = 0;
  final _bodyItem = [
    const GeneralNews(),
    const BusinessNews(),
    const TechNews(),
    const SportsNews(),
    const EntertainmentNews(),
  ];
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
      body: _bodyItem[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
        items: const [
          BottomNavigationBarItem(
            label: 'General',
            icon: Icon(
              Icons.feed_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Business',
            icon: Icon(
              Icons.business_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Technology',
            icon: Icon(
              Icons.laptop_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Sports',
            icon: Icon(
              Icons.sports_cricket_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Entertainment',
            icon: Icon(
              Icons.movie_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
