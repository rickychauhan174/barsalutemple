
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const appColor = Colors.blue;
const errorMsg = "Network error. please try again";

extension sizeInfo on BuildContext {
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

  Widget noDataFound() {
    return SizedBox( height: 80, child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.pin_drop_sharp,color: Colors.grey,size: 30,),
        SizedBox(height: 5,),
        Text("No data found",style: TextStyle(color: Colors.grey,),),
      ],
    ));
  }
}

openReplace(BuildContext context, Widget whichIsOpen) {
  Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => whichIsOpen));
}

open(BuildContext context, Widget whichIsOpen) {
  Navigator.push(
      context, CupertinoPageRoute(builder: (context) => whichIsOpen));
}

Future openWait(BuildContext context, Widget whichIsOpen) async {
  final result = await Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => whichIsOpen),
  );

  return result;
}

class BottomProgress {
  void dismiss(context) {
    Navigator.of(context, rootNavigator: true).pop(true);
  }

  showBottomProgress(context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: bc.height(percentage: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: bc.radius(topR: 40, topL: 40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator()),
                SizedBox(height: 4,),
                Text("Loading")
              ],
            ),
          );
        });
  }
}

Future<bool> showBottomMsgWithAction(context,msg,{String actionText = "OK", String dismissText = "Dismiss"}) async{
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: bc.height(percentage: 22),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: bc.radius(topR: 40, topL: 40)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                  height: 50,
                  width: 50,
                  child: Center(
                      child: Icon(Icons.logout,
                          color:  Colors.black))),
              Text(
                msg,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){
                    Navigator.pop(context,true);
                  }, child: Text(actionText,style: TextStyle(color: appColor[400]))),
                  TextButton(onPressed: (){
                    Navigator.pop(context,false);
                  }, child: Text(dismissText,style: TextStyle(color: Colors.red[400]),))
                ],
              )
            ],
          ),
        );
      });
}


Widget getTile(String title, IconData icon) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(fontSize: 15),
    ),
    leading: Icon(
      icon,
      color: appColor,
    ),
  );
}

Widget infoView({String title, String value}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,style: TextStyle(fontSize: 10,color: Colors.grey),),
      Text(value,style: TextStyle(fontSize: 14),),
    ],
  );
}


class ModelTitleID {
  String name;
  String description;
  String id;

  ModelTitleID({this.name, this.description, this.id});
}
