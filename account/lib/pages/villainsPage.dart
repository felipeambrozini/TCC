import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class VillainsPage extends StatefulWidget {
  static const String tag = '/account/villainsPage';
  @override
  _VillainsPageState createState() => _VillainsPageState();
}

class _VillainsPageState extends State<VillainsPage> {
  BatResponsive _responsive;
  TextEditingController controller;
  String name;

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
    controller = TextEditingController();
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
          controller: controller,
          responsive: _responsive,
          hintText: "Pesquise um vilão do Batman",
          onChanged: (val) {
            setState(() {
              name = val;
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
          "Vilões",
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
        stream: (name != "" && name != null)
            ? Firestore.instance
                .collection('vilians')
                .where("keySearch", arrayContains: name)
                .snapshots()
            : Firestore.instance
                .collection("vilians")
                .orderBy("alterEgo")
                .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text(
              'Erro em carregar os vilões.',
              style: BatFonts.createTitle(),
            ));
          }
          if (!snapshot.hasData) {
            return Center(
                child: Text(
              'Carregando os vilões...',
              style: BatFonts.createTitle(),
            ));
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
