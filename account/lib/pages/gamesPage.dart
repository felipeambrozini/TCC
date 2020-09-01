import 'package:common/common.dart';
import 'package:flutter/material.dart';

class GamesPage extends StatefulWidget {
   static const String tag = '/account/gamesPage';
  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
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
      body: buildGamesPage(),
      backgroundColor: Colors.black,
    );
  }

  Widget buildGamesPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: _responsive.getHeight(64.0),
          width: MediaQuery.of(context).size.width,
          child: AppBar(
            backgroundColor: Colors.yellow,
            centerTitle: true,
            title: Text(
              "Jogos",
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
        ),
      ],
    );
  }
}
