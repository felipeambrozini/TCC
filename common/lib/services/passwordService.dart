import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class PasswordService {
  static PasswordService _instance;

  TextEditingController _passwordController;
  TextEditingController get password => _passwordController;

  factory PasswordService() {
    _instance ??= PasswordService._internal();
    return _instance;
  }

  PasswordService._internal() {
    _passwordController = TextEditingController();
  }

  void setController(bool numeric, int size) {
    String mask = '';

    for (int i = 0; i < size; i++)
      mask += numeric ? '0' : '*';
    
    _passwordController = MaskedTextController(mask: mask, text: '');
  }
}