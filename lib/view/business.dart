import 'package:flutter/material.dart';

class BusinessNews extends StatefulWidget {
  const BusinessNews({Key? key}) : super(key: key);

  @override
  _BusinessNewsState createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Business'),
    );
  }
}
