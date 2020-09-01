import 'package:account/account.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String tag = '/account/homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BatResponsive _responsive;

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildHomePage(),
      backgroundColor: Colors.black,
      appBar: BatAppBar(blackFont: true, color: Colors.yellow),
    );
  }

  Widget buildHomePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [buildTop(), buildMenu()],
    );
  }

  Widget buildTop() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _responsive.getHeight(64.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/batmanLogo.png",
            height: _responsive.getHeight(60.0),
            width: _responsive.getWidth(60.0),
          ),
          Padding(
            padding: EdgeInsets.only(left: _responsive.getWidth(16.0)),
            child: Text(
              "BatPédia",
              style: BatFonts.createTitle(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenu() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _responsive.getWidth(32.0)),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CharactersPage.tag);
                      },
                      child: Column(
                        children: [
                          MenuBox(asset: "assets/images/characters.jpg"),
                          Padding(
                            padding: EdgeInsets.only(
                                top: _responsive.getHeight(16.0)),
                            child: Text(
                              "Personagens",
                              style: BatFonts.createTitle(),
                            ),
                          )
                        ],
                      )),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, HQsPage.tag);
                          },
                          child: MenuBox(asset: "assets/images/hqs.png")),
                      Padding(
                        padding:
                            EdgeInsets.only(top: _responsive.getHeight(16.0)),
                        child: Text(
                          "HQs",
                          style: BatFonts.createTitle(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, MoviesPage.tag);
                          },
                          child: MenuBox(
                            asset: "assets/images/movies.png",
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: _responsive.getHeight(16.0)),
                          child: Text(
                            "Filmes",
                            style: BatFonts.createTitle(),
                          ),
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, TVSeriesPage.tag);
                            },
                            child:
                                MenuBox(asset: "assets/images/animations.png")),
                        Padding(
                          padding:
                              EdgeInsets.only(top: _responsive.getHeight(16.0)),
                          child: Text(
                            "Séries de TV",
                            style: BatFonts.createTitle(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: _responsive.getHeight(32.0)),
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, GamesPage.tag);
                        },
                        child: MenuBox(asset: "assets/images/games.png")),
                    Padding(
                      padding:
                          EdgeInsets.only(top: _responsive.getHeight(16.0)),
                      child: Text(
                        "Jogos",
                        style: BatFonts.createTitle(),
                      ),
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
