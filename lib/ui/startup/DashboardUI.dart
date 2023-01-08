import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barsalutemple/firebase/AdsModel.dart';
import 'package:flutter_barsalutemple/ui/info/InfoUI.dart';
import 'package:flutter_barsalutemple/ui/photos/PhotosUI.dart';
import 'package:flutter_barsalutemple/ui/trust/TrustUi.dart';
import 'package:flutter_barsalutemple/util/Helper.dart';
import 'package:flutter_barsalutemple/firebase/GetItemsFromDb.dart';
import 'package:flutter_barsalutemple/ui/about/AboutusUI.dart';
import 'package:flutter_barsalutemple/util/ColorUtil.dart';
import 'package:package_info/package_info.dart';
import 'package:shape_of_view/shape_of_view.dart';

import '../../util/Utils.dart';

class DashboardUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashState();
  }
}

class DashState extends State<DashboardUI> {
  List<AdsModel> adsList;
  String historyLink = "";
  var isLoading = true;
  var menuTitle = [
    "इतिहास",
    "फोटोस",
    "दानपात्र्",
    "कमेटी",
    "वीडीओस",
    "अन्य ऐप्स",
    "शेयर करे",
    "ऐप के बारे में",
    "रेटिंग",
  ];
  var menuIcon = [
    "assets/images/history.png",
    "assets/images/photos.png",
    "assets/images/rupee.png",
    "assets/images/team.png",
    "assets/images/video.png",
    "assets/images/otherapp.png",
    "assets/images/share.png",
    "assets/images/about.png",
    "assets/images/rateus.png",
  ];

  @override
  void initState() {
    super.initState();
    _getAppVersion();
    _getHistoryLink();
    _getAdsList();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
      ),
      child: Scaffold(
          backgroundColor: backColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Banner list
                  isLoading
                      ? Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Center(child: PlaceHolderWidget()))
                      : ShapeOfView(
                          height: MediaQuery.of(context).size.height * 0.35,
                          shape: RoundRectShape(
                              borderRadius: BorderRadius.circular(8),
                              borderWidth: 0),
                          child: Container(
                              margin: EdgeInsets.all(0),
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: adsList.length,
                                  itemBuilder: (context, index) {
                                    return Banner(
                                        adsList[index], index, adsList.length);
                                  })),
                        ),

                  SizedBox(
                    height: 5,
                  ),
                  Text("<<< swipe left <<<",
                    style: TextStyle(color: Colors.black54,
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.center,),

                  Padding(
                    padding:
                        EdgeInsets.only(top: 25, right: 8, left: 8, bottom: 20),
                    child: GridView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: gridColor,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            onTap: () {
                              onGridItemClick(index);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  menuIcon[index],
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  menuTitle[index],
                                  style: TextStyle(
                                      color: textColorDashboard,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: menuIcon.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  onGridItemClick(int index) {
    switch (index) {
      case 0:
        // History
        Utils.openHistory(historyLink);
        break;
      case 1:
        // Photos
        open(context, PhotosUI());
        break;
      case 2:
        // Danpatar
        open(context, InfoUI());
        break;
      case 3:
        // Commette
        open(context, TrustUi());
        break;
      case 4:
        // Videos
        Utils.openVideos();
        break;
      case 5:
        // More Apps
        Utils.openMoreApps();
        break;
      case 6:
        // Share app
        Utils.shareWithFriends();
        break;
      case 7:
        // About
        open(context, AboutUI());
        break;
      case 8:
        // Rating
        Utils.openPlayStore();
        break;
    }
  }

  _getAppVersion() async {
    var updatedVersion = await GetItemsFromDb.getAppVersion();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionCode = packageInfo.buildNumber;
    if (int.parse(updatedVersion) > int.parse(versionCode)) {
      Utils.showAppUpdateDialog(context);
    }
  }

  _getHistoryLink() async {
    var history = await GetItemsFromDb.getHistoryLink();
    setState(() {
      historyLink = history;
    });
  }

  _getAdsList() async {
    var ads = await GetItemsFromDb.getAds();
    //sort the banner list
    ads.sort((a, b) => a.id.compareTo(b.id));
    setState(() {
      isLoading = false;
      adsList = ads;
    });
  }
}

class Banner extends StatelessWidget {
  String bannerImage;
  String bannerUrl;
  var isHavingUrl = false;
  int adNumber;
  int totalAds;

  Banner(AdsModel ad, int index, int size) {
    bannerImage = ad.image;
    bannerUrl = ad.url;
    if (bannerUrl.isNotEmpty && bannerUrl.startsWith("http")) {
      isHavingUrl = true;
    }
    adNumber = index + 1;
    totalAds = size;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /*decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(right: 10),*/
      child: InkWell(
        onTap: () {
          if (isHavingUrl) {
            Utils.openBrowser(bannerUrl);
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.only(),
          child:
              /*FadeInImage.assetNetwork(
              placeholder: PLACE_HOLDER_IMAGE,
              image: bannerUrl,
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.30,
              fit: BoxFit.cover,
            )*/
              Stack(
            children: [
              CachedNetworkImage(
                  imageUrl: bannerImage,
                  placeholder: (context, url) => PlaceHolderWidget(),
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.35,
                  fit: BoxFit.cover),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceHolderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          ClipRRect(child: Image.asset(PLACE_HOLDER_IMAGE, fit: BoxFit.cover)),
    );
  }
}
