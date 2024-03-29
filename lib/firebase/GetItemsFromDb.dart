import 'dart:async';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_barsalutemple/firebase/AdsModel.dart';
import 'package:flutter_barsalutemple/firebase/BInfoModel.dart';
import 'package:flutter_barsalutemple/firebase/EventsModel.dart';
import 'PhotosModel.dart';
import 'VillagesModel.dart';

class GetItemsFromDb {
  static var firebaseDB = FirebaseDatabase.instance;

  static Future<BInfoModel> getInfo() async {
    Completer<BInfoModel> completer = new Completer<BInfoModel>();
    //enable offline support
    firebaseDB.setPersistenceEnabled(true);
   var a = firebaseDB.reference()
        .child("info");
    a.keepSynced(true);
    a.once()
        .then( (DataSnapshot snapshot) {
      BInfoModel info = new BInfoModel();
      info = BInfoModel.fromMap(snapshot);
      completer.complete(info);
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

  static Future<EventsModel> getEvents() async {
    Completer<EventsModel> completer = new Completer<EventsModel>();
    // var firebaseDB = FirebaseDatabase.instance;
    //enable offline support
    firebaseDB.setPersistenceEnabled(true);
    var a = firebaseDB.reference()
        .child("events");
    a.keepSynced(true);
    a.once()
        .then( (DataSnapshot snapshot) {
      EventsModel event = new EventsModel();
      event = EventsModel.fromMap(snapshot);
      completer.complete(event);
    });

    return completer.future;
  }

  static Future<List<String>> getPhotos() async {
    Completer<List<String>> completer = new Completer<List<String>>();
    // var firebaseDB = FirebaseDatabase.instance;
    //enable offline support
    firebaseDB.setPersistenceEnabled(true);
    var a = firebaseDB.reference()
        .child("photos");
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

  static Future<String> getTrustMembers() async {
    Completer<String> completer = new Completer<String>();
    // var firebaseDB = FirebaseDatabase.instance;
    firebaseDB.reference()
        .child("trust")
        .once()
        .then( (DataSnapshot snapshot) {
      String appVersion = snapshot.value.toString();
      completer.complete(appVersion);
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

  static Future<String> getHistoryLink() async {
    Completer<String> completer = new Completer<String>();
    // var firebaseDB = FirebaseDatabase.instance;
    firebaseDB.reference()
        .child("history")
        .once()
        .then( (DataSnapshot snapshot) {
      String appVersion = snapshot.value.toString();
      completer.complete(appVersion);
    });

    return completer.future;
  }

  static Future<String> getVideoLink() async {
    Completer<String> completer = new Completer<String>();
    // var firebaseDB = FirebaseDatabase.instance;
    firebaseDB.reference()
        .child("video")
        .once()
        .then( (DataSnapshot snapshot) {
      String appVersion = snapshot.value.toString();
      completer.complete(appVersion);
    });

    return completer.future;
  }

  static Future<String> getPanchangLink() async {
    Completer<String> completer = new Completer<String>();
    // var firebaseDB = FirebaseDatabase.instance;
    firebaseDB.reference()
        .child("panchang")
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