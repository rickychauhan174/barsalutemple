import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barsalutemple/firebase/GetItemsFromDb.dart';
import 'package:flutter_barsalutemple/firebase/PhotosModel.dart';
import '../../util/ColorUtil.dart';
import '../startup/DashboardUI.dart';
import 'package:flutter_barsalutemple/util/Utils.dart';

class PhotosUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashState();
  }
}

class DashState extends State<PhotosUI> {
  List<String> photosList;
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
          'Gallery',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 24),
        )
      ),
      body: SingleChildScrollView(
            child: Column(
              children: [
                isLoading
                    ? Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Center(child: PlaceHolderWidget()))
                : ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 10,
                        right: 10
                      ),
                      child: Card(
                        color: cardColor,
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 5,
                          bottom: 5,
                          left: 5,
                          right: 5),
                          child: InkWell(
                            onTap: (){
                             // Image click
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child:
                                    CachedNetworkImage(
                                       imageUrl: photosList[index],
                                        placeholder: (context, url) => PlaceHolderWidget(),
                                        width: MediaQuery.of(context).size.width * 1,
                                        height: MediaQuery.of(context).size.height * 0.30,
                                        fit: BoxFit.cover
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: photosList.length,
                ),
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
    var photos = await GetItemsFromDb.getPhotos();
    setState(() {
      isLoading = false;
      photosList = photos;
    });
  }
}
