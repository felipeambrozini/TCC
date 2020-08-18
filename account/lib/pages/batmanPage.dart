import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class BatmanPage extends StatefulWidget {
  static const String tag = '/account/batmanPage';
  @override
  _BatmanPageState createState() => _BatmanPageState();
}

class _BatmanPageState extends State<BatmanPage> {
  BatResponsive _responsive;
  dynamic data;

  Future<dynamic> getData() async {
    final DocumentReference document = Firestore.instance
        .collection("batman")
        .document("2gydxlfeda0wbpVWm0Mr");

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
      body: buildBatmanPage(),
      backgroundColor: Colors.black,
    );
  }

  Widget buildBatmanPage() {
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
              "Batman",
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
        Expanded(child: Container()),
        GestureDetector(
            onTap: buildBottomSheet, child: Image.network(data['image'])),
        Expanded(child: Container()),
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
              margin: EdgeInsets.only(top: _responsive.getHeight(64.0)),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_responsive.getWidth(20.0)),
                    topRight: Radius.circular(_responsive.getWidth(20.0)),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: _responsive.getWidth(16.0)),
                child: Padding(
                  padding: EdgeInsets.only(top: _responsive.getHeight(128.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Nome: ",
                            style: BatFonts.createTitle(color: Colors.black),
                          ),
                          Text(
                            data["name"],
                            style:
                                BatFonts.createParagraph(color: Colors.black),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: _responsive.getHeight(16.0)),
                        child: Row(
                          children: [
                            Text(
                              "Alter ego: ",
                              style: BatFonts.createTitle(color: Colors.black),
                            ),
                            Text(
                              data["alterEgo"],
                              style:
                                  BatFonts.createParagraph(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Primeira aparição: ",
                            style: BatFonts.createTitle(color: Colors.black),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: _responsive.getHeight(25.0)),
                              child: Text(
                                data["firstAparation"],
                                style: BatFonts.createParagraph(
                                    color: Colors.black),
                                textAlign: TextAlign.justify,
                                maxLines: 5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: _responsive.getHeight(16.0)),
                        child: Row(
                          children: [
                            Text(
                              "Biografia: ",
                              style: BatFonts.createTitle(color: Colors.black),
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
              ));
        });
  }
}
