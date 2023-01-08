import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barsalutemple/firebase/GetItemsFromDb.dart';
import 'package:flutter_barsalutemple/firebase/PhotosModel.dart';
import '../../util/ColorUtil.dart';
import '../startup/DashboardUI.dart';
import 'package:flutter_barsalutemple/util/Utils.dart';

class TrustUi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TrustState();
  }
}

class TrustState extends State<TrustUi> {
  String trustMembersUrl;
  var isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: cardColor,

        title: Text(
          'कमेटी मेंबर्स',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 24),
        )
      ),
      body: Container(
            child: Column(
              children: [
                isLoading
                    ? Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: Center(child: PlaceHolderWidget()))
                : Padding(
                  padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                  ),
                  child: Card(
                    color: colorPrimary,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0),
                      child: InkWell(
                        onTap: (){
                          // Image click
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child:
                              CachedNetworkImage(
                                  imageUrl: trustMembersUrl,
                                  placeholder: (context, url) => PlaceHolderWidget(),
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: MediaQuery.of(context).size.height * 0.80,
                                  fit: BoxFit.cover
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )

    );
  }

  @override
  void initState() {
    super.initState();
    _getPhotosList();
  }

  _getPhotosList() async {
    var url = await GetItemsFromDb.getTrustMembers();
    setState(() {
      isLoading = false;
      trustMembersUrl = url;
    });
  }
}
