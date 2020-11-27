import 'package:account/account.dart';
import 'package:account/pages/batmanPage.dart';
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
  BatUser _user;

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
    _user = BatUser();
    Auth.getUserLocal().then(_onGetUserLocalSuccess);
  }

  void _onGetUserLocalSuccess(BatUser user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: BatDrawer()),
        body: SafeArea(child: buildHomePage()),
        backgroundColor: Colors.black,
        appBar: BatAppBar(blackFont: true, color: Colors.yellow),
      ),
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
            vertical: _responsive.getHeight(32.0),
            horizontal: _responsive.getWidth(16.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Bem vindo ao BatPédia, " + "\n" + _user.name,
              style: BatFonts.createTitle(fontSize: BatFonts.t2),
            ),
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
        height: _responsive.getHeight(64.0),
        width: _responsive.getWidth(64.0),
        child: Center(
          child: Text(getInitials(),
              style: BatFonts.createTitle(
                  fontSize: BatFonts.t2, color: Colors.black),
              textAlign: TextAlign.center),
        ),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.yellow));
  }

  Widget buildMenu() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _responsive.getWidth(16.0)),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, BatmanPage.tag);
                  },
                  child: Column(
                    children: [
                      MenuBox(
                          asset: "assets/images/batman.jpg",
                          responsive: _responsive),
                      Padding(
                        padding:
                            EdgeInsets.only(top: _responsive.getHeight(32.0)),
                        child: Text(
                          "Batman",
                          style: BatFonts.createTitle(fontSize: BatFonts.t2),
                        ),
                      )
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AliesPage.tag);
                      },
                      child: Column(
                        children: [
                          MenuBox(
                              asset: "assets/images/batFamily.png",
                              responsive: _responsive),
                          Text(
                            "Aliados",
                            style: BatFonts.createTitle(fontSize: BatFonts.t2),
                          )
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, VillainsPage.tag);
                        },
                        child: Column(
                          children: [
                            MenuBox(
                                asset: "assets/images/vilians.png",
                                responsive: _responsive),
                            Text(
                              "Vilões",
                              style:
                                  BatFonts.createTitle(fontSize: BatFonts.t2),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ComicsPage.tag);
                      },
                      child: Column(
                        children: [
                          MenuBox(
                              asset: "assets/images/comics.png",
                              responsive: _responsive),
                          Text(
                            "HQs",
                            style: BatFonts.createTitle(fontSize: BatFonts.t2),
                          )
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, MoviesPage.tag);
                        },
                        child: Column(
                          children: [
                            MenuBox(
                                asset: "assets/images/movies.png",
                                responsive: _responsive),
                            Text(
                              "Filmes",
                              style:
                                  BatFonts.createTitle(fontSize: BatFonts.t2),
                            )
                          ],
                        )),
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
                            child: MenuBox(
                                asset: "assets/images/TVseries.png",
                                responsive: _responsive)),
                        Text(
                          "Séries de TV",
                          style: BatFonts.createTitle(fontSize: BatFonts.t2),
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
                            child: MenuBox(
                                asset: "assets/images/games.png",
                                responsive: _responsive)),
                        Text(
                          "Jogos",
                          style: BatFonts.createTitle(fontSize: BatFonts.t2),
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
