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
      body: SafeArea(child: buildBatmanage()),
      backgroundColor: Colors.black,
    );
  }

  Widget buildBatmanage() {
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
          if (!snapshot.hasData) {
            return Center(child: Text('Carregando Batman'));
          }
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            itemBuilder: (BuildContext context, int index) {
              return Image.network(snapshot.data.documents[index]['image']);
            },
            itemCount: snapshot.data.documents.length,
          );
        },
      ),
    );
  }
}
