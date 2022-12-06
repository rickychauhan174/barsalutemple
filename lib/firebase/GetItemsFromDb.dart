import 'dart:async';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_barsalutemple/firebase/AdsModel.dart';
import 'VillagesModel.dart';

class GetItemsFromDb {
  static var firebaseDB = FirebaseDatabase.instance;
  static Future<List<VillagesModel>> getVillages() async {
    Completer<List<VillagesModel>> completer = new Completer<List<VillagesModel>>();
    // var firebaseDB = FirebaseDatabase.instance;
    //enable offline support
    firebaseDB.setPersistenceEnabled(true);
   var a = firebaseDB.reference()
        .child("villages");
    a.keepSynced(true);
    a.once()
        .then( (DataSnapshot snapshot) {
      Map <dynamic, dynamic> mapvalues = snapshot.value;
      List<VillagesModel> villageList = new List();
      mapvalues.forEach((key, values){
        villageList.add(VillagesModel.fromMap(values, key));
      });
      completer.complete(villageList);
    });

    return completer.future;
  }

  static Future<List<AdsModel>> getAds() async {
    Completer<List<AdsModel>> completer = new Completer<List<AdsModel>>();
    // var firebaseDB = FirebaseDatabase.instance;
    //enable offline support
    firebaseDB.setPersistenceEnabled(true);
    var a = firebaseDB.reference()
        .child("ads");
    a.keepSynced(true);
    a.once()
        .then( (DataSnapshot snapshot) {
      Map <dynamic, dynamic> mapvalues = snapshot.value;
      List<AdsModel> adsList = new List();
      mapvalues.forEach((key, values){
        adsList.add(AdsModel.fromMap(values, key));
      });
      completer.complete(adsList);
    });

    return completer.future;
  }

  static Future<String> getAppVersion() async {
    Completer<String> completer = new Completer<String>();
    // var firebaseDB = FirebaseDatabase.instance;
    firebaseDB.reference()
        .child("appVersion")
        .once()
        .then( (DataSnapshot snapshot) {
      String appVersion = snapshot.value.toString();
      completer.complete(appVersion);
    });

    return completer.future;
  }

  static Future<List<String>> getBannerList() async {
    Completer<List<String>> completer = new Completer<List<String>>();
    // var firebaseDB = FirebaseDatabase.instance;
    //enable offline support
    firebaseDB.setPersistenceEnabled(true);
    var a = firebaseDB.reference()
        .child("banners");
      a.keepSynced(true);
       a.once().then( (DataSnapshot snapshot) {
      Map <dynamic, dynamic> mapvalues = snapshot.value;
      List<String> bannerList = new List();
      mapvalues.forEach((key, values){
        bannerList.add(values.toString());
      });
      completer.complete(bannerList);
    });

    return completer.future;
  }
}