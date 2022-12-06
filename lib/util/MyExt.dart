import 'package:flutter/material.dart';

extension SizeInfo on BuildContext {



  double height({percentage = 100}) =>
      MediaQuery.of(this).size.height * (percentage / 100);

  double width({percentage = 100}) =>
      MediaQuery.of(this).size.width * (percentage / 100);

  BorderRadius radius(
      {double topL = 0,
        double bottomL = 0,
        double topR = 0,
        double bottomR = 0}) =>
      BorderRadius.only(
        topRight: Radius.circular(topR),
        bottomRight: Radius.circular(bottomR),
        bottomLeft: Radius.circular(bottomL),
        topLeft: Radius.circular(topL),
      );


  Widget loading() {
    return Center(
        child: SizedBox(
            width: 30, height: 30, child: CircularProgressIndicator()));
  }





}