import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barsalutemple/ui/marriage/user/UsersListUI.dart';
import 'package:flutter_barsalutemple/util/Helper.dart';
import 'package:flutter_barsalutemple/firebase/AdsModel.dart';
import 'package:flutter_barsalutemple/firebase/GetItemsFromDb.dart';
import 'package:flutter_barsalutemple/ui/about/AboutusUI.dart';
import 'package:flutter_barsalutemple/util/ColorUtil.dart';
import 'package:flutter_barsalutemple/ui/dharamshala/DharamshalaUI.dart';
import 'package:flutter_barsalutemple/ui/villages/VillageListScreen.dart';
import 'package:flutter_barsalutemple/ui/marriage/login/LoginUI.dart';
import 'package:flutter_barsalutemple/util/MySession.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info/package_info.dart';
import 'package:shape_of_view/shape_of_view.dart';

import '../../util/Utils.dart';
import '../marriage/user/CreateMarriageProfile.dart';

class DashboardUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashState();
  }
}

class DashState extends State<DashboardUI> {
  List<AdsModel> adsList;
  var isLoading = true;
  var menuTitle = [
    "इतिहास",
    "फोटोस",
    "वीडीओस",
    "अन्य ऐप्स",
    "शेयर करे",
    "ऐप के बारे में",
    "रेटिंग",
  ];
  var menuIcon = [
    "assets/images/history.png",
    "assets/images/dharamshala.png",
    "assets/images/suggestion.png",
    "assets/images/otherapp.png",
    "assets/images/share.png",
    "assets/images/about.png",
    "assets/images/rateus.png",
  ];

  @override
  void initState() {
    super.initState();
    _getAppVersion();
    // _getBannerList();
    _getAdsList();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
      ),
      child: Scaffold(
          backgroundColor: colorPrimary,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Banner list
                  isLoading
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: MediaQuery.of(context).size.height * 0.40,
                          child: Center(child: PlaceHolderWidget()))
                      : ShapeOfView(
                          height: MediaQuery.of(context).size.height * 0.40,
                          shape: BubbleShape(
                              position: BubblePosition.Bottom,
                              arrowPositionPercent: 0.5,
                              borderRadius: 20,
                              arrowHeight: 15,
                              arrowWidth: 15),
                          child: Container(
                              margin: EdgeInsets.all(0),
                              height: MediaQuery.of(context).size.height * 0.40,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: adsList.length,
                                  itemBuilder: (context, index) {
                                    return Banner(adsList[index], index, adsList.length);
                                  })),
                        ),

                  Padding(
                    padding:
                        EdgeInsets.only(top: 25, right: 8, left: 8, bottom: 20),

                    child: GridView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: cardColor,
                          elevation: 15,
                          shape: CircleBorder(
                            // borderRadius: BorderRadius.circular(5.0),
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
                                      color: textColor, fontSize: 18.0),
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
        // Village list
        Utils.openHistory();
        break;
      case 1:
        // History
        open(context, DharamshalaUI());
        break;
      case 2:
        // Dharamshala
        open(context, DharamshalaUI());
        break;
      case 3:
      // Forb
        Utils.openFaceOfRorBiradari();
        break;
      case 4:
        // Suggestions
        Utils.sendEmail();
        break;
      /*case 4:
        // Ror news
        Utils.openRorNews();
        break;*/
      case 5:
        // More apps
        Utils.openMoreApps();
        break;
      case 6:
        // Share
        Utils.shareWithFriends();
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
          if(isHavingUrl) {
            Utils.openBrowser(bannerUrl);
          }

        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
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
                  height: MediaQuery.of(context).size.height * 0.40,
                  fit: BoxFit.cover),
              Visibility(
                visible: isHavingUrl ? true : false,
                child: Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: Card(
                      color: alphaCardColor.withOpacity(0.5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: InkWell(
                          onTap: () {
                            Utils.openBrowser(bannerUrl);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: 5, right: 5, left: 5, bottom: 15),
                              child: Text(
                                "Click to open",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.normal),
                              ))),
                    ),
                  ),
                ),
              ),

              Visibility(
                visible: true,
                child: Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: Align(
                    alignment: FractionalOffset.topRight,
                    child: Card(
                      // color: alphaCardColor.withOpacity(0.4),
                      color: cardColor.withOpacity(0.5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: InkWell(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: 3, right: 8, left: 8, bottom: 3),
                              child: Text(
                                adNumber.toString() + " / " + totalAds.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.normal),
                              ))),
                    ),
                  ),
                ),
              )

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
