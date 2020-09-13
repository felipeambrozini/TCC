import 'package:common/common.dart';
import 'package:flutter/material.dart';

class AliesPage extends StatefulWidget {
  static const String tag = '/account/aliesPage';
  @override
  _AliesPageState createState() => _AliesPageState();
}

class _AliesPageState extends State<AliesPage> {
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
          "Aliados",
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
            children: [
              Row(
                children: [
                  CharactersInformationBox(
                      collection: "alies", document: "alfredPennyworth"),
                  Expanded(child: Container()),
                  CharactersInformationBox(
                      collection: "alies", document: "barbaraGordon"),
                  Expanded(child: Container()),
                  CharactersInformationBox(
                      collection: "alies", document: "carrieKelley")
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "alies", document: "cassandraCain"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "alies", document: "damianWayne"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "alies", document: "dickGrayson")
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "alies", document: "jamesGordon"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "alies", document: "jasonTodd"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "alies", document: "kathyKane")
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
                child: Row(
                  children: [
                    CharactersInformationBox(
                        collection: "alies", document: "luciusFox"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "alies", document: "stephanieBrown"),
                    Expanded(child: Container()),
                    CharactersInformationBox(
                        collection: "alies", document: "timDrake")
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
