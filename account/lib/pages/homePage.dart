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
                        Navigator.pushNamed(context, BatmanPage.tag);
                      },
                      child: MenuBox(asset: "assets/images/batman.png")),
                  Expanded(child: Container()),
                  MenuBox(asset: "assets/images/batFamily.png"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
