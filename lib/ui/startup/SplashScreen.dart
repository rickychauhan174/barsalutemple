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
          child: Container(
            width: 300, height: 300,
            child: Column(
              children:[
                Image.asset(
                  "assets/images/temple.png",
                  width: 180,
                  height: 180,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Sita Ram Mandir\nBarsalu",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center
                  ,
                )
              ],
            ),
          ),
        )
    ));
  }
}