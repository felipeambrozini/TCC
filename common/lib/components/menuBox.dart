import 'package:common/common.dart';
import 'package:flutter/material.dart';

class MenuBox extends StatelessWidget {
  final String asset;
  final BatResponsive responsive;

  MenuBox({@required this.asset, @required this.responsive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsive.getHeight(150.0),
      width: responsive.getHeight(150.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(asset)
        ),
      ),
    );
  }
}
