import 'package:flutter/material.dart';

class BatInputField {
  String label;
  String hintText;
  String errorMsg;
  TextEditingController controller;
  int minLength;
  TextInputType keyboardType;

  BatInputField({
    String label,
    String hintText,
    String errorMsg,
    TextEditingController controller,
    int minLength,
    TextInputType keyboardType,
  }) {
    this.label = label;
    this.hintText = hintText;
    this.errorMsg = errorMsg;
    this.controller = controller;
    this.minLength = minLength;
    this.keyboardType = keyboardType;
  }
}
