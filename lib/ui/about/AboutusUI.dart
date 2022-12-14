

import 'package:flutter/material.dart';
import 'package:flutter_barsalutemple/util/Helper.dart';
import 'package:flutter_barsalutemple/util/ColorUtil.dart';

import '../../util/Utils.dart';

class AboutUI extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AboutState();
  }
}

class AboutState extends State<AboutUI>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
        SliverAppBar(
          backgroundColor: colorPrimary,
          expandedHeight: 50,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10.0),
          sliver: SliverFillRemaining(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [

                    SizedBox(height: 30,),
                    Text("Sita Ram Mandir Barsalu",
                      style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w500,
                          fontSize: 22.0),),
                    SizedBox(height: 5,),
                    // Version
                    Text("Version 1.0.0",
                      style: TextStyle(color: Colors.black,
                          fontSize: 16.0),),
                    SizedBox(height: 30,),

                    // Idea by
                    Text("Special Thanks to",
                      style: TextStyle(color: Colors.black,
                          fontSize: 16.0),
                      textAlign: TextAlign.center,),
                    SizedBox(height: 5,),
                    Text("---------------------------",
                      style: TextStyle(color: Colors.black,
                          fontSize: 16.0),),
                    SizedBox(height: 5,),

                    // Syam
                    Card(
                      color: cardColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: InkWell(
                        onTap: () { Utils.openShyamFacebook();},
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Syam Barsalu",
                                  style: TextStyle(color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.center,),
                              ]
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 40),

                    // Developed by
                    Text("App Developed & Maintained by",
                      style: TextStyle(color: Colors.black,
                          fontSize: 16.0),
                      textAlign: TextAlign.center,),
                    SizedBox(height: 5,),
                    Text("---------------------------",
                      style: TextStyle(color: Colors.black,
                          fontSize: 16.0),),
                    SizedBox(height: 5,),

                    // Rikki
                    Card(
                      color: cardColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: InkWell(
                        onTap: () { Utils.openRikkiFacebook();},
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Rikki Chouhan\n(Abhimanyupur)",
                                  style: TextStyle(color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.center,),
                              ]
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    // Deepu
                    Card(
                      color: cardColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: InkWell(
                        onTap: () { Utils.openDeepakFacebook();},
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              Text("Deepak Kanyan\n(Mathana)",
                              style: TextStyle(color: Colors.yellowAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center,),
                            ]
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        )
      ],),
    );
  }
}