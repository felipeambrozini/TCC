import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class GamesInformationBox extends StatelessWidget {
  final DocumentSnapshot snapshot;
  final BatResponsive responsive;

  GamesInformationBox({@required this.snapshot, @required this.responsive});

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
            image: NetworkImage(snapshot.data['cover']),
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
                                snapshot.data['cover'],
                                height: responsive.getHeight(200.0),
                                width: responsive.getHeight(200.0),
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
                                  snapshot.data["title"],
                                  style: BatFonts.createParagraph(
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: responsive.getHeight(16.0)),
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
                                    snapshot.data["developer"],
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
                                top: responsive.getHeight(16.0)),
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
                                    snapshot.data["platforms"],
                                    style: BatFonts.createParagraph(
                                        color: Colors.black),
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
                                  "Ano de lançamento: ",
                                  style: BatFonts.createTitle(
                                      color: Colors.black,
                                      fontSize: BatFonts.t2),
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data["releaseYear"],
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
                                  "Resumo: ",
                                  style: BatFonts.createTitle(
                                      color: Colors.black,
                                      fontSize: BatFonts.t2),
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data["resume"],
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
