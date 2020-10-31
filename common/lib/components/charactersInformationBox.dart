import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CharactersInformationBox extends StatelessWidget {
  final DocumentSnapshot snapshot;
  final BatResponsive responsive;

  CharactersInformationBox(
      {@required this.snapshot, @required this.responsive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buildBottomSheet(context);
      },
      child: Container(
        height: responsive.getHeight(150.0),
        width: responsive.getHeight(150.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(snapshot.data['image']),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  buildBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
              margin: EdgeInsets.only(top: responsive.getHeight(128.0)),
              padding:
                  EdgeInsets.symmetric(horizontal: responsive.getWidth(16.0)),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(responsive.getWidth(20.0)),
                    topRight: Radius.circular(responsive.getWidth(20.0)),
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
                                  bottom: responsive.getHeight(16.0)),
                              child: Image.network(
                                snapshot.data['image'],
                                height: responsive.getHeight(150.0),
                                width: responsive.getHeight(150.0),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Nome: ",
                                style: BatFonts.createTitle(
                                    color: Colors.black, fontSize: BatFonts.t2),
                              ),
                              Text(
                                snapshot.data["name"],
                                style: BatFonts.createParagraph(
                                    color: Colors.black),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: responsive.getHeight(
                                    snapshot.data["name"] ==
                                            snapshot.data["alterEgo"]
                                        ? 0.0
                                        : 16.0)),
                            child: snapshot.data["name"] ==
                                    snapshot.data["alterEgo"]
                                ? Container()
                                : Row(
                                    children: [
                                      Text(
                                        "Alter ego: ",
                                        style: BatFonts.createTitle(
                                            color: Colors.black,
                                            fontSize: BatFonts.t2),
                                      ),
                                      Text(
                                        snapshot.data["alterEgo"],
                                        style: BatFonts.createParagraph(
                                            color: Colors.black),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: responsive.getHeight(16.0)),
                            child: Row(
                              children: [
                                Text(
                                  "Criador: ",
                                  style: BatFonts.createTitle(
                                      color: Colors.black,
                                      fontSize: BatFonts.t2),
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data["creator"],
                                    style: BatFonts.createParagraph(
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: responsive.getHeight(16.0)),
                            child: Row(
                              children: [
                                Text(
                                  "Primeira aparição: ",
                                  style: BatFonts.createTitle(
                                      color: Colors.black,
                                      fontSize: BatFonts.t2),
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data["firstAparation"],
                                    style: BatFonts.createParagraph(
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: responsive.getHeight(16.0)),
                            child: Row(
                              children: [
                                Text(
                                  "Biografia: ",
                                  style: BatFonts.createTitle(
                                      color: Colors.black,
                                      fontSize: BatFonts.t2),
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data["biography"],
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
