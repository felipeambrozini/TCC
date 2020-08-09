import 'dart:async';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class LoginService {
  static LoginService _instance;
  LoginStep step;

  String email;

  StreamController<BatInputField> _streamController;
  Stream<BatInputField> get streamData => _streamController.stream;

  factory LoginService() {
    _instance ??= LoginService._internalConstructor();
    return _instance;
  }

  LoginService._internalConstructor() {
    _streamController = StreamController<BatInputField>.broadcast();
  }

  void setLoginData() async {
    BatInputField dataField;
    switch (step) {
      case LoginStep.EMAIL:
        dataField = BatInputField(
          label: 'E-mail',
          errorMsg: 'Email inválido',
          controller: TextEditingController(text: email),
          keyboardType: TextInputType.emailAddress,
        );
        break;
      case LoginStep.PASSWORD:
        dataField = BatInputField(
          label: 'Senha',
          errorMsg: 'Email ou senha incorretos',
          controller: MaskedTextController(mask: '000000'),
          keyboardType: TextInputType.number,
          minLength: 6,
        );
        break;
      default:
    }
    await Future.delayed(Duration(seconds: 0), () {
      _streamController.add(dataField);
    });
  }
}

enum LoginStep { EMAIL, PASSWORD }
