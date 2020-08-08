import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:common/common.dart';

class WelcomePage extends StatefulWidget {
  static const String tag = '/main/welcome';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  AppResponsive _responsive;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    _responsive = AppResponsive();
  }

  buildLoginBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
              margin: EdgeInsets.only(top: _responsive.getHeight(160.0)),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_responsive.getWidth(20.0)),
                    topRight: Radius.circular(_responsive.getWidth(20.0)),
                  )),
              child: Container());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BatAppBar(blackFont: false, color: Colors.transparent),
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: buildLogo()),
              buildWelcomeMensage(),
              Expanded(child: Container()),
              buildButtons(),
            ],
          ),
          _isLoading
              ? Container(
                  color: Colors.grey.withOpacity(0.3),
                  child: Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green))))
              : Container()
        ],
      ),
    );
  }

  Widget buildLogo() {
    return Padding(
      padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
      child: Column(
        children: [
          Text(
            "BatPedia",
            style: AppFonts.createTitle(),
          ),
          Padding(
            padding: EdgeInsets.only(top: _responsive.getHeight(16.0)),
            child: Image.asset("assets/images/batmanLogo.png"),
          ),
        ],
      ),
    );
  }

  Widget buildWelcomeMensage() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: _responsive.getHeight(16.0),
        horizontal: _responsive.getWidth(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Bem-vindo ao BatPedia",
            style: AppFonts.createParagraph(
              fontSize: _responsive.getWidth(24.0),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Padding(
            padding: EdgeInsets.only(top: _responsive.getHeight(16.0)),
            child: Text(
              "A enciclopédia digital do Batman, onde você vai encontrar as principais informações do universo do Batman.",
              style: AppFonts.createParagraph(
                fontSize: AppFonts.p1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtons() => Padding(
        padding: EdgeInsets.only(
          bottom: _responsive.getHeight(37.0),
          right: _responsive.getWidth(10.0),
          left: _responsive.getWidth(10.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: BatButton(
                onPressed: buildLoginBottomSheet,
                text: 'Já sou noodle',
                color: Colors.yellow,
              ),
            ),
            Expanded(
              child: BatButton(
                color: Colors.yellow,
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                },
                text: 'Quero ser noodle',
              ),
            ),
          ],
        ),
      );
}
