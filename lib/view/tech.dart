import 'package:flutter/material.dart';

class TechNews extends StatefulWidget {
  const TechNews({ Key? key }) : super(key: key);

  @override
  _TechNewsState createState() => _TechNewsState();
}

class _TechNewsState extends State<TechNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Technology'),
    );
  }
}