import 'package:common/common.dart';
import 'package:flutter/material.dart';

class MenuBox extends StatefulWidget {
  final String asset;

  const MenuBox({Key key, @required this.asset}) : super(key: key);
  @override
  _MenuBoxState createState() => _MenuBoxState();
}

class _MenuBoxState extends State<MenuBox> {
  BatResponsive _responsive;

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _responsive.getHeight(150.0),
      width: _responsive.getHeight(150.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.asset),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
