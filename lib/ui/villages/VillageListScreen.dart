

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barsalutemple/util/Helper.dart';
import 'package:flutter_barsalutemple/firebase/GetItemsFromDb.dart';
import 'package:flutter_barsalutemple/firebase/VillagesModel.dart';
import 'package:flutter_barsalutemple/ui/gotra/GotraScreen.dart';

import '../../util/ColorUtil.dart';


class VillageListScreen extends StatefulWidget {
  VillageListScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<VillageListScreen> {
  List<VillagesModel> villageListFromFirebase;
  List<VillagesModel> searchVillageList = List<VillagesModel>();
  var isLoading = true;
  var activeSearch = false;
  var showSearchList = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activeSearch = false;
    _getVillages();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorPrimary,
        body: Container(
          child: CustomScrollView(
            slivers: [
              _appBar(),
              SliverFillRemaining(
                child: Container(
                  decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  height: height,
                  width: width,
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Padding(
                          padding:
                              const EdgeInsets.only(left: 5.0, right: 5.0,top: 10),
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: _resultWidgets(),
                          ),
                        ),
                ),
              )
            ],
          ),
        ));
  }

  SliverAppBar _appBar() {
    if (activeSearch) {
      return SliverAppBar(
        leading: Icon(Icons.search),
        title: TextField(
          autofocus: true,
          onChanged: _search,
          cursorColor: textColor,
          decoration: InputDecoration(
            hintText: "Search village",
            hintStyle: TextStyle(
              color: textColor, fontSize: 20.0),
            filled: true,
            fillColor: cardColor
          ),
          style: TextStyle(
              color: textColor, fontSize: 20.0),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                showSearchList = false;
                activeSearch = false;
              });
            },
          )
        ],
      );
    } else {
      return SliverAppBar(
        title: Text("गाँव"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => setState(() => activeSearch = true),
          ),
        ],
      );
    }
  }

  void _search(String queryString) {
    // do some searching and sorting
    // then call setState() with the results
    // and then in your ListView you can read from results
    // (handle empty, default case as well in view)
    List<VillagesModel> searchResults = List<VillagesModel>();
    if(queryString.isNotEmpty) {
      for (var village in villageListFromFirebase) {
        if (village.id.toUpperCase().startsWith(queryString.toUpperCase()) ||
            village.name.toUpperCase().startsWith(queryString.toUpperCase())) {
          searchResults.add(village);
        }
      }
    }else{
      searchResults = villageListFromFirebase;
    }
    setState(() {
      showSearchList = true;
      searchVillageList = searchResults;
    });
  }

  Widget _resultWidgets() {
    if (showSearchList) {
      return _listContents(searchVillageList);
    } else {
      return _listContents(villageListFromFirebase);
    }
    // return _listContents(villageListFromFirebase);
  }

  _getVillages() async {
    var villageFirebase = await GetItemsFromDb.getVillages();
    //sort the village list
    villageFirebase.sort((a, b) => a.id.compareTo(b.id));

    setState(() {
      isLoading = false;
      villageListFromFirebase = villageFirebase;
    });
  }


  showAllGotra( VillagesModel villageName) {
    List<ModelTitleID> list = villageName.gotra.split(",").map((e) {
      var model = ModelTitleID();
      model.name = e;
       model.description = "";
      return model;}).toList();

    showBottomList(context, list,title: "${villageName.id}(${villageName.name})").then((value) {

    });
  }


  Widget _listContents (List<VillagesModel> villageList){
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider( height: 3, color: Colors.grey[800]),
      itemBuilder: (BuildContext context, int index) {

        return Padding(
          padding: const EdgeInsets.only(
              top: 15,
              right: 10,
              left: 10,
              bottom: 15),
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              open(context, GotraScreen(village: villageList[index]));
              //showAllGotra(villageListFromFirebase[index]);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
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
                        villageList[index].id,
                        style: TextStyle(fontSize: 20.0,
                            color: textColor),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            villageList[index].name,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: textColor),
                          ),
                          SizedBox(width: 5,),

                          Text(
                            "(${villageList[index].dist}/${villageList[index].state})",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: textColor),
                          ),

                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: textColor,
                    size: 18,
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: villageList.length,
    );
  }
}

