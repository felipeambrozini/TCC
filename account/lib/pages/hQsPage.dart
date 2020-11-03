import 'package:common/common.dart';
import 'package:flutter/material.dart';

class HQsPage extends StatefulWidget {
  static const String tag = '/account/HQsPage';
  @override
  _HQsPageState createState() => _HQsPageState();
}

class _HQsPageState extends State<HQsPage> {
  BatResponsive _responsive;

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BatAppBar(blackFont: true, color: Colors.yellow),
      body: SafeArea(child: buildHQsPage()),
      backgroundColor: Colors.black,
    );
  }

  Widget buildHQsPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [buildTop()],
    );
  }

  Widget buildTop() {
    return Container(
      height: _responsive.getHeight(64.0),
      width: MediaQuery.of(context).size.width,
      child: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(
          "Histórias em Quadrinhos",
          style: BatFonts.createTitle(color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
