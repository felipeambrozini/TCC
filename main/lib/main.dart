import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/splashScreen.dart';
import 'pages/welcomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(BatPedia());
  });
}

class BatPedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        title: 'BatPedia',
        home: SplashScreen(),
        routes: {
          WelcomePage.tag: (context) => WelcomePage(),
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildMyBehavior(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
