import 'package:account/account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CharactersPage extends StatefulWidget {
  static const String tag = '/account/CharactersPage';
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  BatResponsive _responsive;
  dynamic data;

  Future<dynamic> getData() async {
    final DocumentReference document =
        Firestore.instance.collection("batman").document("batman");

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        data = snapshot.data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BatAppBar(blackFont: true, color: Colors.yellow),
      body: buildCharactersPage(),
      backgroundColor: Colors.black,
    );
  }

  Widget buildCharactersPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: _responsive.getHeight(64.0),
          width: MediaQuery.of(context).size.width,
          child: AppBar(
            backgroundColor: Colors.yellow,
            centerTitle: true,
            title: Text(
              "Personagens",
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
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: _responsive.getWidth(_responsive.getWidth(16.0)),
              vertical: _responsive.getHeight(32.0)),
          child: Row(
            children: [
              Column(
                children: [
                  GestureDetector(
                      onTap: buildBottomSheet,
                      child: MenuBox(asset: "assets/images/batman.png")),
                  Padding(
                    padding: EdgeInsets.only(top: _responsive.getHeight(16.0)),
                    child: Text(
                      "Batman",
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
                        Navigator.pushNamed(context, AliesPage.tag);
                      },
                      child: MenuBox(asset: "assets/images/batFamily.png")),
                  Padding(
                    padding: EdgeInsets.only(top: _responsive.getHeight(16.0)),
                    child: Text(
                      "Aliados",
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
                        Navigator.pushNamed(context, VillainsPage.tag);
                      },
                      child: MenuBox(asset: "assets/images/vilians.png")),
                  Padding(
                    padding: EdgeInsets.only(top: _responsive.getHeight(16.0)),
                    child: Text(
                      "Vilões",
                      style: BatFonts.createTitle(),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  buildBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
              margin: EdgeInsets.only(top: _responsive.getHeight(128.0)),
              padding:
                  EdgeInsets.symmetric(horizontal: _responsive.getWidth(16.0)),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_responsive.getWidth(20.0)),
                    topRight: Radius.circular(_responsive.getWidth(20.0)),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScrollIcon(
                    color: Colors.black,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: _responsive.getHeight(16.0)),
                              child: Image.network(
                                data['image'],
                                height: _responsive.getHeight(200.0),
                                width: _responsive.getHeight(200.0),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Nome: ",
                                style:
                                    BatFonts.createTitle(color: Colors.black),
                              ),
                              Text(
                                data["name"],
                                style: BatFonts.createParagraph(
                                    color: Colors.black),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: _responsive.getHeight(16.0)),
                            child: Row(
                              children: [
                                Text(
                                  "Alter ego: ",
                                  style:
                                      BatFonts.createTitle(color: Colors.black),
                                ),
                                Text(
                                  data["alterEgo"],
                                  style: BatFonts.createParagraph(
                                      color: Colors.black),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: _responsive.getHeight(16.0)),
                            child: Row(
                              children: [
                                Text(
                                  "Criador: ",
                                  style:
                                      BatFonts.createTitle(color: Colors.black),
                                ),
                                Expanded(
                                  child: Text(
                                    data["creator"],
                                    style: BatFonts.createParagraph(
                                        color: Colors.black),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: _responsive.getHeight(16.0)),
                            child: Row(
                              children: [
                                Text(
                                  "Primeira aparição: ",
                                  style:
                                      BatFonts.createTitle(color: Colors.black),
                                ),
                                Flexible(
                                  child: Text(
                                    data["firstAparation"],
                                    style: BatFonts.createParagraph(
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: _responsive.getHeight(16.0)),
                            child: Row(
                              children: [
                                Text(
                                  "Biografia: ",
                                  style:
                                      BatFonts.createTitle(color: Colors.black),
                                ),
                                Flexible(
                                  child: Text(
                                    data["biography"],
                                    style: BatFonts.createParagraph(
                                        color: Colors.black),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}
