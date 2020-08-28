import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class InformationBox extends StatefulWidget {
  final String collection, document;

  const InformationBox(
      {Key key, @required this.collection, @required this.document})
      : super(key: key);

  @override
  _InformationBoxState createState() => _InformationBoxState();
}

class _InformationBoxState extends State<InformationBox> {
  BatResponsive _responsive;
  dynamic data;

  Future<dynamic> getData() async {
    final DocumentReference document = Firestore.instance
        .collection(widget.collection)
        .document(widget.document);

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
            image: NetworkImage(data['image']),
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
                              padding:  EdgeInsets.only(bottom: _responsive.getHeight(16.0)),
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
                                Expanded(
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
                                Expanded(
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
