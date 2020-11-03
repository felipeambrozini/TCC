import 'package:common/common.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  static const String tag = '/account/about';
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
      backgroundColor: Colors.black,
      body: SafeArea(child: buildAboutPage()),
    );
  }

  Widget buildAboutPage() {
    return Column(
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
          "Sobre o aplicativo",
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
    return Column(
      children: [
        builDataItem("O que é o BatPédia?",
            "O BatPédia é a enciclopédia digital Batman, nela você vai encontrar as principais informações do personagem, de seus aliados, vilões, histórias em quadrinhos, filmes, séries de TV e jogos."),
        builDataItem("Política de privacidade",
            "Nossa política de privacidade segue as normas da Lei de Proteção de Dados(LGPD), por isso pode ficar tranquilo que seus dados estarão seguros."),
      ],
    );
  }

  Widget builDataItem(
    String title,
    String data,
  ) {
    return Container(
        margin: EdgeInsets.only(
            left: _responsive.getWidth(16.0),
            right: _responsive.getWidth(16.0),
            top: _responsive.getHeight(32.0)),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            horizontal: _responsive.getWidth(16.0),
            vertical: _responsive.getHeight(16.0)),
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: BatFonts.createTitle(color: Colors.black)),
            Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(8.0)),
                child: Text(data,
                    style: BatFonts.createParagraph(color: Colors.black))),
          ],
        ));
  }
}
