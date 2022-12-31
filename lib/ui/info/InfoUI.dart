

import 'package:flutter/material.dart';
import 'package:flutter_barsalutemple/firebase/BInfoModel.dart';
import 'package:flutter_barsalutemple/firebase/GetItemsFromDb.dart';
import 'package:flutter_barsalutemple/util/Helper.dart';
import 'package:flutter_barsalutemple/util/ColorUtil.dart';

import '../../util/Utils.dart';

class InfoUI extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return InfoState();
  }
}

class InfoState extends State<InfoUI>{
  BInfoModel info = new BInfoModel();

  @override
  void initState() {
    super.initState();
    _getInfo();
  }

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
                    Text("दानपात्र्",
                      style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w500,
                          fontSize: 30.0),),
                    SizedBox(height: 15,),
                    // Version
                    Text("नाम: " + info.name,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18.0),),
                    SizedBox(height: 10,),

                    Text("अकाउंट नंबर: " + info.ac,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18.0),),
                    SizedBox(height: 10,),

                    Text("IFSC: " + info.ifs,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18.0),),
                    SizedBox(height: 10,),

                    Text("बैंक: " + info.bname,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18.0),),
                    SizedBox(height: 10,),

                    Text("ब्रांच: " + info.bcity,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18.0),),
                    SizedBox(height: 10,),

                    // Rikki
                    Card(
                      color: cardColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: InkWell(
                        onTap: () { Utils.shareDanpatar(info);},
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Share",
                                  style: TextStyle(color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
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

  _getInfo() async {
    var binfo = await GetItemsFromDb.getInfo();
    setState(() {
      info = binfo;
    });
  }
}