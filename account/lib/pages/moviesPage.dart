import 'package:common/common.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  static const String tag = '/account/movie';
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
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
      body: buildMoviesPage(),
      backgroundColor: Colors.black,
    );
  }

  Widget buildMoviesPage() {
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
          "Filmes",
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
                  MoviesInformationBox(document: "batmanTheMovie"),
                  Expanded(child: Container()),
                  MoviesInformationBox(document: "batman"),
                  Expanded(child: Container()),
                  MoviesInformationBox(document: "batmanReturns"),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    MoviesInformationBox(document: "maskOfThePhantasm"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "batmanFoverer"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "batman&Robin"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    MoviesInformationBox(document: "subzero"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "returnOfTheJoker"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "mysteryOfTheBatwoman"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    MoviesInformationBox(document: "begins"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "batmanVsDracula"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "gothamKnight"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    MoviesInformationBox(document: "theDarkKnight"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "underTheRedHood"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "yearOne"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    MoviesInformationBox(document: "theDarkKnightRises"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "theDarkKnightP1"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "theDarkKnightP2"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    MoviesInformationBox(document: "lego"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "sonOfBatman"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "assaultOnArkham"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    MoviesInformationBox(document: "batmanVsRobin"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "animalInstincts"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "monsterMayhem"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    MoviesInformationBox(document: "badBlood"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "theKillingJoke"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "returnOfTheCapedCrusaders"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    MoviesInformationBox(document: "legoBatman"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "batmanAndHarleyQuinn"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "batmanVsTwoFace"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    MoviesInformationBox(document: "gaslight"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "ninja"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "turtles"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    MoviesInformationBox(document: "hush"),
                    Expanded(child: Container()),
                    MoviesInformationBox(document: "joker"),
                    Expanded(child: Container()),
                    Container(
                      height: _responsive.getHeight(150.0),
                      width: _responsive.getHeight(150.0),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
