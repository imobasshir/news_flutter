import 'package:flutter/material.dart';

class GeneralNews extends StatefulWidget {
  const GeneralNews({ Key? key }) : super(key: key);

  @override
  _GeneralNewsState createState() => _GeneralNewsState();
}

class _GeneralNewsState extends State<GeneralNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('General'),
    );
  }
}