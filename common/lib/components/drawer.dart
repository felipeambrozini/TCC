import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:main/pages/welcomePage.dart';
import 'package:account/account.dart';

class BatDrawer extends StatefulWidget {
  @override
  _BatDrawerState createState() => _BatDrawerState();
}

class _BatDrawerState extends State<BatDrawer> {
  BatResponsive _responsive;
  Auth _auth;

  List<Map> optionsList = [
    {
      'icon': Icons.person,
      'label': 'Informações Pessoais',
      'routeName': PersonalInformationPage.tag,
    },
    {
      'icon': Icons.info,
      'label': 'Sobre o aplicativo',
      'routeName': AboutPage.tag,
    },
  ];

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
    _auth = Auth();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Drawer(
        elevation: 0.0,
        child: Container(
          padding: EdgeInsets.only(top: _responsive.getHeight(64.0)),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(_responsive.getWidth(16.0)),
              bottomRight: Radius.circular(_responsive.getWidth(16.0)),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildList(),
              buildExit(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList() => Expanded(
        child: ListView.builder(
            padding: EdgeInsets.all(0.0),
            itemCount: optionsList.length,
            itemBuilder: (BuildContext context, int index) {
              return buildListItem(optionsList[index]);
            }),
      );

  Widget buildListItem(Map item) => FlatButton(
        colorBrightness: Brightness.dark,
        onPressed: () => Navigator.pushNamed(context, item['routeName']),
        padding: EdgeInsets.symmetric(
          vertical: _responsive.getHeight(24.0),
          horizontal: _responsive.getWidth(20.0),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              item['icon'],
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(left: _responsive.getWidth(20.0)),
              child: Text(item['label'],
                  style: BatFonts.createTitle(color: Colors.black)),
            )
          ],
        ),
      );

  Widget buildExit() => Padding(
        padding: EdgeInsets.only(
            left: _responsive.getWidth(20.0),
            bottom: _responsive.getHeight(30.0)),
        child: GestureDetector(
          onTap: () async {
            await _auth.signOut();
            Navigator.of(context)
                .popUntil(ModalRoute.withName(WelcomePage.tag));
          },
          child: Row(
            children: [
              Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.only(left: _responsive.getWidth(20.0)),
                child: Text(
                  "Sair",
                  style: BatFonts.createTitle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
