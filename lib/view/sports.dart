import 'package:flutter/material.dart';

class SportsNews extends StatefulWidget {
  const SportsNews({ Key? key }) : super(key: key);

  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Sports'),
    );
  }
}