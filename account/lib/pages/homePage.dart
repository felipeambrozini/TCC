import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String tag = '/account/homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.yellow,
    );
  }
}