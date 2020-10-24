import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class GamesInformationBox extends StatefulWidget {
  final String document;

  GamesInformationBox({@required this.document});

  @override
  _GamesInformationBoxState createState() => _GamesInformationBoxState();
}

class _GamesInformationBoxState extends State<GamesInformationBox> {
  BatResponsive _responsive;
  dynamic data;

  Future<dynamic> getData() async {
    final DocumentReference document =
        Firestore.instance.collection("games").document(widget.document);

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
    return GestureDetector(
      onTap: buildBottomSheet,
      child: Container(
        height: _responsive.getHeight(150.0),
        width: _responsive.getHeight(150.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(data['cover']),
     fit: BoxFit.fill,
          ),
        ),
      ),
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
                                data['cover'],
                                height: _responsive.getHeight(200.0),
                                width: _responsive.getHeight(200.0),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Título: ",
                                style: BatFonts.createTitle(
                                    color: Colors.black, fontSize: BatFonts.t2),
                              ),
                              Expanded(
                                child: Text(
                                  data["title"],
                                  style: BatFonts.createParagraph(
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: _responsive.getHeight(16.0)),
                            child: Row(
                              children: [
                                Text(
                                  "Desenvolvedora: ",
                                  style: BatFonts.createTitle(
                                      color: Colors.black,
                                      fontSize: BatFonts.t2),
                                ),
                                Expanded(
                                  child: Text(
                                    data["developer"],
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
                                  "Plataformas: ",
                                  style: BatFonts.createTitle(
                                      color: Colors.black,
                                      fontSize: BatFonts.t2),
                                ),
                                Expanded(
                                  child: Text(
                                    data["platforms"],
                                    style: BatFonts.createParagraph(
                                        color: Colors.black),
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
                                  "Ano de lançamento: ",
                                  style: BatFonts.createTitle(
                                      color: Colors.black,
                                      fontSize: BatFonts.t2),
                                ),
                                Expanded(
                                  child: Text(
                                    data["releaseYear"],
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
                                  "Resumo: ",
                                  style: BatFonts.createTitle(
                                      color: Colors.black,
                                      fontSize: BatFonts.t2),
                                ),
                                Expanded(
                                  child: Text(
                                    data["resume"],
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
