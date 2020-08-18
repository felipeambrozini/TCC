import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ScrollIcon extends StatefulWidget {
  @override
  _ScrollIconState createState() => _ScrollIconState();
}

class _ScrollIconState extends State<ScrollIcon> {
  BatResponsive _responsive;

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: _responsive.getHeight(18.5)),
        decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(
              Radius.circular(2.0),
            )),
        width: _responsive.getWidth(34.0),
        height: _responsive.getHeight(4.0),
      ),
    );
  }
}
