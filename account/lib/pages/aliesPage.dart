import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class AliesPage extends StatefulWidget {
  static const String tag = '/account/aliesPage';
  @override
  _AliesPageState createState() => _AliesPageState();
}

class _AliesPageState extends State<AliesPage> {
  BatResponsive _responsive;
  TextEditingController textController;
  String search;

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BatAppBar(blackFont: true, color: Colors.yellow),
      body: SafeArea(child: buildAliesPage()),
      backgroundColor: Colors.black,
    );
  }

  Widget buildAliesPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTop(),
        SearchBox(
          controller: textController,
          responsive: _responsive,
          hintText: "Pesquise um aliado do Batman",
          onChanged: (val) {
            setState(() {
              search = val;
            });
          },
        ),
        buildBody()
      ],
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
      child: StreamBuilder(
        stream: (search != "" && search != null)
            ? Firestore.instance
                .collection('alies')
                .where("keySearch", arrayContains: search)
                .orderBy("name")
                .snapshots()
            : Firestore.instance
                .collection("alies")
                .orderBy("name")
                .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text(
              'Erro em carregar os aliados.',
              style: BatFonts.createTitle(),
            ));
          }
          if (!snapshot.hasData) {
            return Center(
                child: Text('Carregando os aliados...',
                    style: BatFonts.createTitle()));
          }
          return GridView.builder(
            padding:
                EdgeInsets.symmetric(horizontal: _responsive.getWidth(16.0)),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: _responsive.getWidth(16.0),
                mainAxisSpacing: _responsive.getHeight(32.0)),
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
