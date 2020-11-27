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

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BatAppBar(blackFont: true, color: Colors.yellow),
      body: SafeArea(child: buildBatmanPage()),
      backgroundColor: Colors.black,
    );
  }

  Widget buildBatmanPage() {
    return Column(
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
    );
  }

  Widget buildBody() {
    return Expanded(
      child: StreamBuilder(
        stream: Firestore.instance.collection('batman').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text(
              'Erro em carregar os filmes.',
              style: BatFonts.createTitle(),
            ));
          }
          if (!snapshot.hasData) {
            return Center(
                child: Text('Carregando Batman...',
                    style: BatFonts.createTitle()));
          }
          return GridView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: _responsive.getWidth(16.0),
                vertical: _responsive.getHeight(32.0)),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            itemBuilder: (BuildContext context, int index) {
              return CharactersInformationBox(
                responsive: _responsive,
                snapshot: snapshot.data.documents[index],
              );
            },
            itemCount: snapshot.data.documents.length,
          );
        },
      ),
    );
  }
}
