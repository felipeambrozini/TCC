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
  AppResponsive _responsive;
  RegisterStep _registerStep;
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  bool _obscureText;

  @override
  void initState() {
    super.initState();
    _responsive = AppResponsive();
    _registerStep = RegisterStep.WELCOME;
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: buildRegisterPage(),
    );
  }

  Widget buildRegisterPage() {
    return Column(
      children: [ScrollIcon(), buildTop(), buildBody()],
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
              style: AppFonts.createTitle(),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                color: Colors.transparent,
                child: Icon(
                  Icons.close,
                  color: Colors.yellow,
                  size: _responsive.getWidth(32.0),
                ),
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
              height: _responsive.getHeight(400.0),
            ),
          ),
          Text(
            "Para realizar o cadastro no BatPedia vamos precisar do seu nome, e-mail e você deve criar uma senha de 6 dígitos",
            style: AppFonts.createParagraph(),
          ),
          Center(child: buildStarRegisterButton())
        ],
      ),
    );
  }

  Widget buildStarRegisterButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _responsive.getHeight(64.0)),
      child: Row(
        children: [
          Expanded(
              child: BatButton(
                  text: "Começar cadastro",
                  onPressed: () {
                    setState(() {
                      _registerStep = RegisterStep.REGISTER;
                    });
                  }))
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
          buildInputData(
              Icons.person, "Digite seu nome", "Nome: ", nameController),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: _responsive.getHeight(16.0)),
            child: buildInputData(
                Icons.mail, "Digite seu e-mail", "Email: ", emailController),
          ),
          buildInputPassword(
              Icons.lock,
              _obscureText ? Icons.visibility_off : Icons.visibility,
              "Digite seu senha",
              "Senha: ",
              passwordController),
          buildRegisterButton()
        ],
      ),
    );
  }

  Widget buildInputData(IconData icon, String hintText, String prefixText,
      TextEditingController controller) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.yellow,
        ),
        Padding(
          padding: EdgeInsets.only(left: _responsive.getWidth(8.0)),
          child: Text(
            prefixText,
            style: AppFonts.createParagraph(),
          ),
        ),
        Flexible(
          child: TextField(
            controller: controller,
            style: AppFonts.createParagraph(),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: AppFonts.createParagraph(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildInputPassword(IconData prefixicon, IconData sufixicon,
      String hintText, String prefixText, TextEditingController controller) {
    return Row(
      children: [
        Icon(
          prefixicon,
          color: Colors.yellow,
        ),
        Padding(
          padding: EdgeInsets.only(left: _responsive.getWidth(8.0)),
          child: Text(
            prefixText,
            style: AppFonts.createParagraph(),
          ),
        ),
        Flexible(
          child: TextField(
            style: AppFonts.createParagraph(),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: AppFonts.createParagraph(),
            ),
            obscureText: _obscureText,
          ),
        ),
        IconButton(
          icon: Icon(
            sufixicon,
            color: Colors.yellow,
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
      padding: EdgeInsets.symmetric(vertical: _responsive.getHeight(64.0)),
      child: Row(
        children: [
          Expanded(
            child: BatButton(text: "Realizar cadastro", onPressed: _signUp),
          )
        ],
      ),
    );
  }

  Future _signUp() async {
    final email = emailController.text;
    final password = passwordController.text;
    await Auth.signUp(email, password)
        .then(_onResultSignUpSuccess)
        .catchError((error) {
      Flushbar(
        title: 'Erro',
        message: error.toString(),
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }

  void _onResultSignUpSuccess(String userId) {
    final email = emailController.text;
    final name = nameController.text;

    final user = User(userId: userId, name: name, email: email);
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: _responsive.getHeight(64.0)),
            child: Image.asset("assets/images/batFamily.jpg"),
          ),
          Text(
            "Cadastro realizado com sucesso. \nBem-vindo ao BatPédia!",
            style: AppFonts.createParagraph(fontWeight: FontWeight.bold),
          ),
          buildReturnButton()
        ],
      ),
    );
  }

  Widget buildReturnButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _responsive.getHeight(64.0)),
      child: Row(
        children: [
          Expanded(
            child: BatButton(
                text: "Finalizar cadastro",
                onPressed: () {
                  Navigator.pushNamed(context, WelcomePage.tag);
                }),
          )
        ],
      ),
    );
  }
}

enum RegisterStep { WELCOME, REGISTER, SUCESS }
