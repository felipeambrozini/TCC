import 'package:common/common.dart';
import 'package:flutter/material.dart';

class VillainsPage extends StatefulWidget {
  static const String tag = '/account/villainsPage';
  @override
  _VillainsPageState createState() => _VillainsPageState();
}

class _VillainsPageState extends State<VillainsPage> {
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
      body: buildAliesPage(),
      backgroundColor: Colors.black,
    );
  }

  Widget buildAliesPage() {
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
          "Vilões",
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
              vertical: _responsive.getHeight(64.0)),
          child: Column(
            children: [
              Row(
                children: [
                  CharactersInformationBox(
                      collection: "vilians", document: "anarquia"),
                  Expanded(child: Container()),
                  CharactersInformationBox(
                      collection: "vilians", document: "arlequina"),
                  Expanded(child: Container()),
                  CharactersInformationBox(
                      collection: "vilians", document: "bane"),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "vilians", document: "caraDeBarro"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "chapeleiroLouco"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "charada"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "vilians", document: "cobraVenenosa"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "coringa"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "crocodilo"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "vilians", document: "duasCaras"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "duelaDent"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "espantalho"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "vilians", document: "exterminador"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "grandeTubaraoBranco"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "heraVenenosa"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "vilians", document: "homemCalendario"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "homemCoruja"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "homemGato"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "vilians", document: "hugoStrange"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "kgbesta"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "mariposaAssassina"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "vilians", document: "mascaraNegra"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "maxieZeus"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "mestreDasPistas"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "vilians", document: "morcegoHumano"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "mulherGato"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "pinguim"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "vilians", document: "pistoleiro"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "prometheus"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "rasAlGhul"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "vilians", document: "senhorFrio"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "silencio"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "solomonGrundy"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "vilians", document: "vagalume"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "ventriloquo"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "vilians", document: "victorZsasz"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
