
import 'package:flutter/material.dart';
import 'package:flutter_barsalutemple/util/Utils.dart';
import 'package:flutter_barsalutemple/ui/VillageMapUI.dart';

import '../../firebase/VillagesModel.dart';
import 'package:flutter_barsalutemple/util/Helper.dart';

import '../../util/ColorUtil.dart';

class GotraScreen extends StatefulWidget {
  final VillagesModel village;
  GotraScreen({Key key, @required this.village}) : super(key: key);

  @override
  _GotraState createState() => _GotraState();
}

class _GotraState extends State<GotraScreen> {
  var isHavingLocation = false;
  @override
  Widget build(BuildContext context) {
    if(widget.village.location.isNotEmpty){
      isHavingLocation = true;
    }
    var villageListFromFirebase = widget.village.gotra.split(",");
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: colorPrimary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("${widget.village.id} (${widget.village.name})",
                style: TextStyle(color: textColor)),
            backgroundColor: Colors.transparent,
            expandedHeight: 50,
          ),
          SliverFillRemaining(
            child: Container(
              decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              height: height,
              width: width,
              child:   Padding(
                padding:
                const EdgeInsets.only(left: 5.0, right: 5.0,top: 10),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) => Divider( height: 3, color: Colors.grey[800]),
                    itemBuilder: (BuildContext context, int index) {

                    return InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 5),
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    villageListFromFirebase[index],
                                    style: TextStyle(fontSize: 20.0,
                                    color: textColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                    itemCount: villageListFromFirebase.length,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Visibility(
        visible: isHavingLocation ? true : false,
        child: FloatingActionButton.extended(
          onPressed: () {
            Utils.openMap(widget.village.location, widget.village.name);
          },
          label: Text(
            'Map',
            style: TextStyle(
                color: white, fontSize: 20.0),),
          icon: Image.asset("assets/images/map.png",
              height: 35),
          backgroundColor: mapColor,
        ),
      ),
    );
  }
}