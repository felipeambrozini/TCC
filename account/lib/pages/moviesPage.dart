import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  static const String tag = '/account/movie';
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
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
      body: SafeArea(child: buildMoviesPage()),
      backgroundColor: Colors.black,
    );
  }

  Widget buildMoviesPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTop(),
        SearchBox(
          controller: textController,
          responsive: _responsive,
          hintText: "Pesquise um filme do Batman",
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
          "Filmes",
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
                .collection('movies')
                .where("keySearch", arrayContains: search)
                .orderBy('releaseYear')
                .snapshots()
            : Firestore.instance
                .collection("movies")
                .orderBy("releaseYear")
                .snapshots(),
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
                child: Text(
              'Carregando os filmes...',
              style: BatFonts.createTitle(),
            ));
          }
          return GridView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: _responsive.getWidth(16.0),
                vertical: _responsive.getHeight(32.0)),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: _responsive.getWidth(16.0),
                mainAxisSpacing: _responsive.getHeight(32.0)),
            itemBuilder: (BuildContext context, int index) {
              return MoviesInformationBox(
                  responsive: _responsive,
                  snapshot: snapshot.data.documents[index]);
            },
            itemCount: snapshot.data.documents.length,
          );
        },
      ),
    );
  }
}
