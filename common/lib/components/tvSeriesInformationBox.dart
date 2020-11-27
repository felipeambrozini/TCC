import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class TVSeriesInformationBox extends StatelessWidget {
  final DocumentSnapshot snapshot;
  final BatResponsive responsive;

  TVSeriesInformationBox({this.snapshot, @required this.responsive});

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
          image: DecorationImage(image: NetworkImage(snapshot.data['cover'])),
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
                  ScrollIcon(color: Colors.black, responsive: responsive),
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
                                  "Showrunner: ",
                                  style: BatFonts.createTitle(
                                      color: Colors.black,
                                      fontSize: BatFonts.t2),
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data["showrunner"],
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
                                  "Elenco Principal: ",
                                  style: BatFonts.createTitle(
                                      color: Colors.black,
                                      fontSize: BatFonts.t2),
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data["cast"],
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
                                  "Anos de exibição: ",
                                  style: BatFonts.createTitle(
                                      color: Colors.black,
                                      fontSize: BatFonts.t2),
                                ),
                                Text(
                                  snapshot.data["exhibitionYears"],
                                  style: BatFonts.createParagraph(
                                      color: Colors.black),
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
                                  "Sinopse: ",
                                  style: BatFonts.createTitle(
                                      color: Colors.black,
                                      fontSize: BatFonts.t2),
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data["synopsis"],
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
