

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
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [

                    SizedBox(height: 30,),
                    Text("ROR",
                      style: TextStyle(color: textColor,
                        fontWeight: FontWeight.w500,
                          fontSize: 30.0),),
                    SizedBox(height: 5,),
                    // Version
                    Text("Version 1.0.0",
                      style: TextStyle(color: textColor,
                          fontSize: 18.0),),
                    SizedBox(height: 30,),

                    // App info 1
                    Text("This app contains the list of all Villages & Gotras of Ror community. Other menus cover the History and Dharamshalas.",
                      style: TextStyle(color: textColor,
                          fontSize: 18.0),
                    textAlign: TextAlign.center,),
                    SizedBox(height: 10,),

                    // App info 2
                    Text("Anyone can query for adding or modification of the data by using सुझाव menu on home screen.",
                      style: TextStyle(color: textColor,
                          fontSize: 18.0),
                      textAlign: TextAlign.center,),
                    SizedBox(height: 30,),

                    // Developed by
                    Text("Developed & Maintained by",
                      style: TextStyle(color: textColor,
                          fontSize: 18.0),
                      textAlign: TextAlign.center,),
                    SizedBox(height: 5,),
                    Text("------------------------------------------",
                      style: TextStyle(color: textColor,
                          fontSize: 18.0),),
                    SizedBox(height: 5,),

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
                              Image.asset("assets/images/instagram.png"),
                              Text("Deepak Kanyan",
                              style: TextStyle(color: textColor,
                                  fontSize: 18.0),
                              textAlign: TextAlign.center,),
                            ]
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),

                    // Pillu
                    /*Card(
                      color: cardColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: InkWell(
                        onTap: () { Utils.openVishalFacebook();},
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                          child: Text("Vishal Graak",
                            style: TextStyle(color: textColor,
                                fontSize: 18.0),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),*/

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
                              Image.asset("assets/images/instagram.png"),
                              Text("Rikki Chouhan",
                              style: TextStyle(color: textColor,
                                  fontSize: 18.0),
                              textAlign: TextAlign.center,),
                            ]
                          ),
                        ),
                      ),
                    )
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