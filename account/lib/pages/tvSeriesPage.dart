import 'package:common/common.dart';
import 'package:flutter/material.dart';

class TVSeriesPage extends StatefulWidget {
  static const String tag = '/account/tvSeriesPage';
  @override
  _TVSeriesPageState createState() => _TVSeriesPageState();
}

class _TVSeriesPageState extends State<TVSeriesPage> {
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
      body: SafeArea(child: buildTVSeriesPage()),
      backgroundColor: Colors.black,
    );
  }

  Widget buildTVSeriesPage() {
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
          "Séries de TV",
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
              vertical: _responsive.getHeight(32.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TVSeriesInformationBox(document: "batman"),
                  Expanded(child: Container()),
                  TVSeriesInformationBox(document: "theNewAdventuresOfBatman"),
                  Expanded(child: Container()),
                  TVSeriesInformationBox(document: "theAnimatedSeries"),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    TVSeriesInformationBox(document: "theNewBatmanAdventures"),
                    Expanded(child: Container()),
                    TVSeriesInformationBox(document: "batmanBeyond"),
                    Expanded(child: Container()),
                    TVSeriesInformationBox(document: "birdsOfPrey"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    TVSeriesInformationBox(document: "theBatman"),
                    Expanded(child: Container()),
                    TVSeriesInformationBox(document: "theBraveAndTheBold"),
                    Expanded(child: Container()),
                    TVSeriesInformationBox(document: "beware"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    TVSeriesInformationBox(document: "gotham"),
                    Expanded(child: Container()),
                    TVSeriesInformationBox(document: "batwoman"),
                    Expanded(child: Container()),
                    Container(
                      height: _responsive.getHeight(150.0),
                      width: _responsive.getHeight(150.0),
                    )
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
