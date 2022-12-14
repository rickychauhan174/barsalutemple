

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
                    Text("Donation",
                      style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w500,
                          fontSize: 30.0),),
                    SizedBox(height: 15,),
                    // Version
                    Text("Name: " + info.name,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18.0),),
                    SizedBox(height: 10,),

                    Text("Account No: " + info.ac,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18.0),),
                    SizedBox(height: 10,),

                    Text("IFSC: " + info.ifs,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18.0),),
                    SizedBox(height: 10,),

                    Text("Bank: " + info.bname,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18.0),),
                    SizedBox(height: 10,),

                    Text("Branch: " + info.bcity,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18.0),),
                    SizedBox(height: 10,),

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