import 'package:account/account.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';

class HomePage extends StatefulWidget {
  static const String tag = '/account/homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  BatResponsive _responsive;
  User _user;

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
    _user = User();
    Auth.getUserLocal().then(_onGetUserLocalSuccess);
  }

  void _onGetUserLocalSuccess(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: BatDrawer()),
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
        padding: EdgeInsets.symmetric(
            vertical: _responsive.getHeight(64.0),
            horizontal: _responsive.getWidth(16.0)),
        child: Row(
          children: [
            Text(
              "Bem vindo ao BatPédia, " + "\n" + _user.name,
              style: BatFonts.createTitle(fontSize: BatFonts.t2),
            ),
            Expanded(child: Container()),
            GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState.openDrawer();
                },
                child: buildCircularAvatar())
          ],
        ));
  }

  String getInitials() {
    if (_user.name != null) {
      String strInitialFull = '';
      List<String> strInitial = _user.name.trim().split(' ');
      if (strInitial.length > 1) {
        strInitialFull = strInitial[0].substring(0, 1);
        strInitialFull =
            strInitialFull + strInitial[strInitial.length - 1].substring(0, 1);
        return strInitialFull.toUpperCase();
      } else {
        strInitialFull = strInitial[0].substring(0, 1);
        return strInitialFull.toUpperCase();
      }
    } else {
      return '';
    }
  }

  Widget buildCircularAvatar() {
    return Container(
      height: _responsive.getHeight(80.0),
      width: _responsive.getWidth(80.0),
      child: Center(
        child: Text(
          getInitials(),
          style: BatFonts.createTitle(
            fontSize: BatFonts.t2,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
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
                              style:
                                  BatFonts.createTitle(fontSize: BatFonts.t2),
                            ),
                          )
                        ],
                      )),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, GadgetsPage.tag);
                          },
                          child: MenuBox(asset: "assets/images/gadgets.jpg")),
                      Padding(
                        padding:
                            EdgeInsets.only(top: _responsive.getHeight(16.0)),
                        child: Text(
                          "Acessórios",
                          style: BatFonts.createTitle(fontSize: BatFonts.t2),
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
                            Navigator.pushNamed(context, HQsPage.tag);
                          },
                          child: MenuBox(asset: "assets/images/hqs.png"),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: _responsive.getHeight(16.0)),
                          child: Text(
                            "HQs",
                            style: BatFonts.createTitle(fontSize: BatFonts.t2),
                          ),
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, MoviesPage.tag);
                            },
                            child: MenuBox(asset: "assets/images/movies.png")),
                        Padding(
                          padding:
                              EdgeInsets.only(top: _responsive.getHeight(16.0)),
                          child: Text(
                            "Filmes",
                            style: BatFonts.createTitle(fontSize: BatFonts.t2),
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
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, TVSeriesPage.tag);
                            },
                            child:
                                MenuBox(asset: "assets/images/seriesTv.png")),
                        Padding(
                          padding:
                              EdgeInsets.only(top: _responsive.getHeight(16.0)),
                          child: Text(
                            "Séries de TV",
                            style: BatFonts.createTitle(fontSize: BatFonts.t2),
                          ),
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    Column(
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
                            style: BatFonts.createTitle(fontSize: BatFonts.t2),
                          ),
                        )
                      ],
                    ),
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
