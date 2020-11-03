import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';

class PersonalInformationPage extends StatefulWidget {
  static const String tag = '/account/personalInformation';
  @override
  _PersonalInformationPageState createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  BatResponsive _responsive;
  BatUser _user;

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
    _user = BatUser();
    Auth.getUserLocal().then(_onGetUserLocalSuccess);
  }

  void _onGetUserLocalSuccess(BatUser user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BatAppBar(blackFont: true, color: Colors.yellow),
      backgroundColor: Colors.black,
      body: SafeArea(child: buildPersonalInformationPage()),
    );
  }

  Widget buildPersonalInformationPage() {
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
          "Informações Pessoias",
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
    return Column(
      children: [
        builDataItem("Nome completo", _user.name, Icons.person),
        builDataItem("E-mail", _user.email, Icons.mail),
      ],
    );
  }

  Widget builDataItem(String title, String data, IconData icon) {
    return Container(
        margin: EdgeInsets.only(
            left: _responsive.getWidth(16.0),
            right: _responsive.getWidth(16.0),
            top: _responsive.getHeight(32.0)),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            horizontal: _responsive.getWidth(16.0),
            vertical: _responsive.getHeight(16.0)),
        color: Colors.yellow,
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            Padding(
              padding: EdgeInsets.only(left: _responsive.getWidth(16.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: BatFonts.createTitle(color: Colors.black)),
                  Padding(
                      padding: EdgeInsets.only(top: _responsive.getHeight(8.0)),
                      child: Text(data,
                          style:
                              BatFonts.createParagraph(color: Colors.black))),
                ],
              ),
            ),
          ],
        ));
  }
}
