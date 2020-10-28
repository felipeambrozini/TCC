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
      body: SafeArea(child: buildGamesPage()),
      backgroundColor: Colors.black,
    );
  }

  Widget buildGamesPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [buildTop(), buildBody()],
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
    );
  }

  Widget buildBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: _responsive.getWidth(16.0),
              vertical: _responsive.getHeight(32.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GamesInformationBox(document: "batman1986"),
                  Expanded(child: Container()),
                  GamesInformationBox(document: "theCapedCrusader"),
                  Expanded(child: Container()),
                  GamesInformationBox(document: "batman1989"),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    GamesInformationBox(document: "batman1990"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "batman1992"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "returnOfTheJoker"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    GamesInformationBox(document: "batmanReturns"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "theAnimatedSeries"),
                    Expanded(child: Container()),
                    GamesInformationBox(
                        document: "theAdventuresofBatman&Robin"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    GamesInformationBox(document: "batmanForeverArcade"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "batman&Robin"),
                    Expanded(child: Container()),
                    GamesInformationBox(
                        document: "batmanBeyondReturnoftheJoker"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    GamesInformationBox(document: "chaosinGotham"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "gothamCityRacer"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "vengeance"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    GamesInformationBox(document: "darkTomorrow"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "riseofSinTzu"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "begins"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    GamesInformationBox(document: "lego"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "arkhamAsylum"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "braveAndTheBold"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    GamesInformationBox(document: "arkhamCity"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "lego2"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "arkhamOrigins"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    GamesInformationBox(document: "arkhamOriginsBlackgate"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "batman"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "lego3"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    GamesInformationBox(document: "arkhamKnight"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "arkhamVR"),
                    Expanded(child: Container()),
                    GamesInformationBox(document: "theTelltaleSeries"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: GamesInformationBox(document: "theEnemyWithin"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
