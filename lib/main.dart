import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barsalutemple/util/ColorUtil.dart';
import 'ui/startup/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(primaryColor: colorPrimary,
      buttonColor: mrgDark,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: mrgDark
      ),
      fontFamily: 'Rye'
      ),
    );
  }
}
