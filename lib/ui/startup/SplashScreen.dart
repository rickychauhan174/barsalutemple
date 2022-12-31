import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_barsalutemple/util/ColorUtil.dart';
import 'package:flutter_barsalutemple/util/Helper.dart';
import 'DashboardUI.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
            () => openReplace(context, DashboardUI()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: Image.asset(
          "assets/images/temple.png",
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.contain,
    ),
        )
    ));
  }
}