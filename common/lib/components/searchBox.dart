import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final BatResponsive responsive;
  final String hintText;
  final Function(String) onChanged;

  SearchBox(
      {@required this.controller,
      @required this.responsive,
      @required this.hintText, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsive.getWidth(16.0)),
      margin: EdgeInsets.symmetric(
          horizontal: responsive.getWidth(16.0),
          vertical: responsive.getHeight(32.0)),
      width: MediaQuery.of(context).size.width,
      height: responsive.getHeight(64.0),
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(responsive.getWidth(20.0))),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: BatFonts.createParagraph(color: Colors.black)),
              style: BatFonts.createParagraph(color: Colors.black),
              cursorColor: Colors.black,
              onChanged: onChanged,
            ),
          ),
          Icon(CupertinoIcons.search, color: Colors.black)
        ],
      ),
    );
  }
}
