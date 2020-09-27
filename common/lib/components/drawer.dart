import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:main/pages/welcomePage.dart';

class BatDrawer extends StatefulWidget {
  @override
  _BatDrawerState createState() => _BatDrawerState();
}

class _BatDrawerState extends State<BatDrawer> {
  BatResponsive _responsive;
  Auth _auth;
  User _user;

  List<Map> optionsList = [
    {
      'icon': Icons.person,
      'label': 'Informações Pessoais',
      'routeName': null,
    },
    {
      'icon': Icons.info,
      'label': 'Sobre o aplicativo',
      'routeName': null,
    },
  ];

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
    _auth = Auth();
    _user = User();
    Auth.getUserLocal().then(_onGetUserLocalSuccess);
  }

  void _onGetUserLocalSuccess(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Drawer(
        elevation: 0.0,
        child: Container(
          padding: EdgeInsets.only(top: _responsive.getHeight(40.0)),
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
              buildTop(),
              buildList(),
              buildExit(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTop() => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          vertical: _responsive.getHeight(32.0),
        ),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black))),
        child: Column(
          children: [
            Text(
              _user.name,
              style: BatFonts.createTitle(
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _responsive.getHeight(16.0),
                  right: _responsive.getWidth(32.0)),
              child: Text(
                _user.email,
                style: BatFonts.createTitle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );

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
              child: Text(
                item['label'],
                style: BatFonts.createTitle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      );

  Widget buildExit() => Padding(
        padding: EdgeInsets.only(
          left: _responsive.getWidth(20.0),
          bottom: _responsive.getHeight(30.0),
        ),
        child: GestureDetector(
          onTap: () async {
            await _auth.signOut();
            FocusScope.of(context).unfocus();
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
