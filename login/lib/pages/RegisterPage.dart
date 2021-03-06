import 'package:common/common.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:main/pages/welcomePage.dart';

class RegisterPage extends StatefulWidget {
  static const String tag = '/login/registerPage';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  BatResponsive _responsive;
  BatValidations _validations;
  RegisterStep _registerStep;
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  FocusNode nameFocusNode;
  FocusNode emailFocusNode;
  FocusNode passwordFocusNode;
  bool _obscureText;
  bool _erroMsgN;
  bool _erroMsgE;
  bool _erroMsgP;

  @override
  void initState() {
    super.initState();
    _responsive = BatResponsive();
    _validations = BatValidations();
    _registerStep = RegisterStep.WELCOME;
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    _obscureText = true;
    _erroMsgN = false;
    _erroMsgE = false;
    _erroMsgP = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: buildRegisterPage(),
    );
  }

  Widget buildRegisterPage() {
    return Column(
      children: [
        ScrollIcon(color: Colors.black, responsive: _responsive),
        buildTop(),
        buildBody()
      ],
    );
  }

  Widget buildTop() => Padding(
        padding: EdgeInsets.symmetric(
            vertical: _responsive.getHeight(32.0),
            horizontal: _responsive.getWidth(16.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Cadastro',
              style: BatFonts.createTitle(color: Colors.black),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                color: Colors.transparent,
                child: Icon(Icons.close, color: Colors.black),
              ),
            ),
          ],
        ),
      );

  Widget buildBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _registerStep == RegisterStep.WELCOME
                ? buildWelcome()
                : _registerStep == RegisterStep.REGISTER
                    ? buildRegister()
                    : buildSucess()
          ],
        ),
      ),
    );
  }

  Widget buildWelcome() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _responsive.getWidth(16.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/images/batCave.jpg",
              height: _responsive.getHeight(320.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _responsive.getHeight(32.0)),
            child: Text(
                "Para realizar o cadastro no BatPédia vamos precisar do seu nome, e-mail e criar uma senha de 6 dígitos",
                style: BatFonts.createTitle(
                    color: Colors.black, fontSize: BatFonts.t3),
                textAlign: TextAlign.center),
          ),
          Center(child: buildStarRegisterButton())
        ],
      ),
    );
  }

  Widget buildStarRegisterButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _responsive.getHeight(32.0)),
      child: Row(
        children: [
          Expanded(
            child: BatButton(
              text: "Começar cadastro",
              onPressed: () {
                setState(() {
                  _registerStep = RegisterStep.REGISTER;
                });
              },
              responsive: _responsive,
              buttonColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRegister() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _responsive.getWidth(16.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildInputName(),
          _erroMsgN ? buildErrorMessage("Nome inválido") : Container(),
          Padding(
              padding:
                  EdgeInsets.symmetric(vertical: _responsive.getHeight(16.0)),
              child: buildInputEmail()),
          _erroMsgE ? buildErrorMessage("E-mail inválido") : Container(),
          buildInputPassword(),
          _erroMsgP ? buildErrorMessage("Senha inválida") : Container(),
          buildRegisterButton()
        ],
      ),
    );
  }

  Widget buildInputName() {
    return Row(
      children: [
        Icon(CupertinoIcons.person, color: Colors.black),
        Padding(
          padding: EdgeInsets.only(left: _responsive.getWidth(16.0)),
          child: Text(
            "Nome: ",
            style: BatFonts.createTitle(color: Colors.black),
          ),
        ),
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            controller: nameController,
            keyboardType: TextInputType.name,
            style: BatFonts.createParagraph(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Digite seu nome",
              hintStyle: BatFonts.createParagraph(color: Colors.black),
            ),
            focusNode: nameFocusNode,
            autofocus: true,
            onEditingComplete: () {
              _validations.validateName(nameController.text)
                  ? FocusScope.of(context).requestFocus(emailFocusNode)
                  : setState(() {
                      _erroMsgN = true;
                    });
            },
            onChanged: (text) {
              setState(() {
                _erroMsgN = false;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildInputEmail() {
    return Row(
      children: [
        Icon(CupertinoIcons.mail, color: Colors.black),
        Padding(
          padding: EdgeInsets.only(left: _responsive.getWidth(16.0)),
          child: Text(
            "Email: ",
            style: BatFonts.createTitle(color: Colors.black),
          ),
        ),
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: BatFonts.createParagraph(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Digite seu e-mail",
              hintStyle: BatFonts.createParagraph(color: Colors.black),
            ),
            focusNode: emailFocusNode,
            onEditingComplete: () {
              _validations.validateEmail(emailController.text)
                  ? FocusScope.of(context).requestFocus(passwordFocusNode)
                  : setState(() {
                      _erroMsgE = true;
                    });
            },
            onChanged: (text) {
              setState(() {
                _erroMsgE = false;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildInputPassword() {
    return Row(
      children: [
        Icon(CupertinoIcons.lock, color: Colors.black),
        Padding(
          padding: EdgeInsets.only(left: _responsive.getWidth(16.0)),
          child: Text(
            "Senha: ",
            style: BatFonts.createTitle(color: Colors.black),
          ),
        ),
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            style: BatFonts.createParagraph(color: Colors.black),
            controller: passwordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Digite seu senha",
              hintStyle: BatFonts.createParagraph(color: Colors.black),
            ),
            obscureText: _obscureText,
            focusNode: passwordFocusNode,
            onEditingComplete: () {
              _validations.validatePassword(passwordController.text)
                  ? FocusScope.of(context).unfocus()
                  : setState(() {
                      _erroMsgP = true;
                    });
            },
            onChanged: (text) {
              setState(() {
                _erroMsgP = false;
              });
            },
          ),
        ),
        IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ],
    );
  }

  Widget buildRegisterButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _responsive.getHeight(120.0)),
      child: Row(
        children: [
          Expanded(
            child: BatButton(
              text: "Realizar cadastro",
              onPressed: _signUp,
              responsive: _responsive,
              buttonColor: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget buildErrorMessage(String errorMsg) => Padding(
        padding: EdgeInsets.symmetric(vertical: _responsive.getHeight(16.0)),
        child: Text(
          errorMsg,
          style: BatFonts.createParagraph(
            color: Colors.red,
          ),
        ),
      );

  Future _signUp() async {
    final email = emailController.text;
    final password = passwordController.text;
    await Auth.signUp(email, password)
        .then(_onResultSignUpSuccess)
        .catchError((error) {
      Flushbar(
        titleText: Text(
          'Erro',
          style: BatFonts.createTitle(color: Colors.yellow),
        ),
        messageText: Text(
          Auth.getExceptionText(error),
          style: BatFonts.createParagraph(color: Colors.yellow),
        ),
        backgroundColor: Colors.black,
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }

  void _onResultSignUpSuccess(String userId) {
    final email = emailController.text;
    final name = nameController.text;

    final user = BatUser(userId: userId, name: name, email: email);
    Auth.addUser(user).then(_onResultAddUser);
  }

  void _onResultAddUser(result) {
    setState(() {
      _registerStep = RegisterStep.SUCESS;
    });
  }

  Widget buildSucess() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _responsive.getWidth(16.0)),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: _responsive.getHeight(64.0)),
            child: Image.asset("assets/images/batFamily.png"),
          ),
          Text(
            "Cadastro realizado com sucesso. \nBem-vindo ao BatPédia!",
            style: BatFonts.createTitle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          buildFinishButton()
        ],
      ),
    );
  }

  Widget buildFinishButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _responsive.getHeight(64.0)),
      child: Row(
        children: [
          Expanded(
            child: BatButton(
                text: "Finalizar cadastro",
                onPressed: () {
                  Navigator.pushNamed(context, WelcomePage.tag);
                },
                responsive: _responsive,
                buttonColor: Colors.black),
          )
        ],
      ),
    );
  }
}

enum RegisterStep { WELCOME, REGISTER, SUCESS }
