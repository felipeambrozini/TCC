import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:flutter/services.dart';
import 'package:login/login.dart';

class WelcomePage extends StatefulWidget {
  static const String tag = '/main/welcome';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  BatResponsive _responsive;

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  buildLoginPageBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setLoginState) {
            return Container(
                margin: EdgeInsets.only(top: _responsive.getHeight(160.0)),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_responsive.getWidth(20.0)),
                      topRight: Radius.circular(_responsive.getWidth(20.0)),
                    )),
                child: LoginPage(setLoginStatter: setLoginState));
          });
        });
  }

  buildRegisterPageBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setRegisterStatter) {
            return Container(
                margin: EdgeInsets.only(top: _responsive.getHeight(160.0)),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_responsive.getWidth(20.0)),
                      topRight: Radius.circular(_responsive.getWidth(20.0)),
                    )),
                child: RegisterPage(setRegisterStatter: setRegisterStatter));
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BatAppBar(blackFont: true, color: Colors.yellow),
        backgroundColor: Colors.black,
        body: SafeArea(child: buildWelcomePage()));
  }

  Widget buildWelcomePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(child: buildLogo()),
        buildWelcomeMensage(),
        Expanded(child: Container()),
        buildButtons(),
      ],
    );
  }

  Widget buildLogo() {
    return Padding(
      padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
      child: Column(
        children: [
          Text(
            "BatPédia",
            style: BatFonts.createTitle(),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: _responsive.getHeight(128.0)),
            child: Image.asset("assets/images/batmanLogo.png"),
          ),
        ],
      ),
    );
  }

  Widget buildWelcomeMensage() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _responsive.getWidth(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Bem-vindo ao BatPédia",
            style: BatFonts.createTitle(),
            textAlign: TextAlign.left,
          ),
          Padding(
            padding: EdgeInsets.only(top: _responsive.getHeight(16.0)),
            child: Text(
              "A enciclopédia digital do Batman, onde você vai encontrar as principais informações do universo do Batman.",
              style: BatFonts.createParagraph(fontSize: BatFonts.t3),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtons() => Padding(
        padding: EdgeInsets.symmetric(
          vertical: _responsive.getHeight(32.0),
          horizontal: _responsive.getWidth(16.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: BatButton(
                onPressed: buildLoginPageBottomSheet,
                text: 'Login',
              ),
            ),
            Expanded(
              child: BatButton(
                  text: 'Cadastro', onPressed: buildRegisterPageBottomSheet),
            ),
          ],
        ),
      );
}

