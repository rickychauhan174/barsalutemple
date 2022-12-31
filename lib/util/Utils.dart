import 'dart:io';
import 'dart:ui';

import 'package:android_intent/android_intent.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barsalutemple/firebase/BInfoModel.dart';
import 'package:flutter_barsalutemple/util/ColorUtil.dart';
import 'package:flutter_barsalutemple/util/MyExt.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

const String PLACE_HOLDER_IMAGE = "assets/images/placeholder.png";

class Utils {
  static showAppUpdateDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("UPDATE"),
      onPressed: () {
        Navigator.of(context).pop();// dismiss dialog
        openPlayStore();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("New version available"),
      content: Text("Please, update app to new version."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showAppInfoDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK", style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 18)),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: cardColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Ram Mandir Barsalu',
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Version: 1.0.0',
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 20))
        ],
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showMesageDialog(BuildContext context, String title, String message) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: cardColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(message,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 20))
        ],
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static Future<void> openPlayStore() async {
    if (Platform.isAndroid) {
      AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: 'https://play.google.com/store/apps/details?id=barsalu.temple',
      );
      await intent.launch();
    }
  }

  static Future<void> shareWithFriends() async {
    Share.share('Download Ram Mandir Barsalu app from Play Store.\nhttps://play.google.com/store/apps/details?id=barsalu.temple');
  }

  static Future<void> openMoreApps() async {
    if (Platform.isAndroid) {
      AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: 'https://play.google.com/store/apps/developer?'
            'id=HR07+Apps&hl=en_IN',
      );
      await intent.launch();
    }
  }

  static openHistory() async {
    const url = 'https://villageinfo.in/haryana/karnal/nilokheri/barsalu.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static openVideos() async {
    const url = 'https://www.youtube.com/@avadhbiharidass8870/videos';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static openBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static openRorNews() async {
    const url = 'http://ror24x7tv.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> openMap(String latlng, String villageName) async {
    if(latlng.isNotEmpty) {
      var locArr = latlng.split(",");
      var lat = double.tryParse(locArr[0]);
      var lng = double.tryParse(locArr[1]);
      MapsLauncher.launchCoordinates(lat, lng, villageName);
    }
  }

  static openFitMe() async {
    var appPackage = "com.fit.me";
    bool isInstalled = await DeviceApps.isAppInstalled(appPackage);
    if(isInstalled) {
      DeviceApps.openApp(appPackage);
    }else{
      openAppOnPlayStore(appPackage);
    }
  }

  static openMyYogaLife() async {
    var appPackage = "com.dpk.mylifemyyoga";
    bool isInstalled = await DeviceApps.isAppInstalled(appPackage);
    if(isInstalled) {
      DeviceApps.openApp(appPackage);
    }else{
      openAppOnPlayStore(appPackage);
    }
  }

  static Future<void> openAppOnPlayStore(String appPackage) async {
    if (Platform.isAndroid) {
      AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: 'https://play.google.com/store/apps/details?id='+
        appPackage,
      );
      await intent.launch();
    }
  }

  static openRikkiFacebook() async {
    const url = 'https://www.facebook.com/ricky.ror';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static openFaceOfRorBiradari() async {
    const url = 'https://www.youtube.com/channel/UCfVRZyBuoFx0P-ojwwaMHOA';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static openDeepakFacebook() async {
    const url = 'https://www.facebook.com/deepak.mathana';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static openVishalFacebook() async {
    const url = 'https://www.facebook.com/vishal.graakror';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static sendEmail() async {
    // Android and iOS
    const uri =
        'mailto:hr07apps@gmail.com?subject=ROR App | Suggestions&body=Hello,';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  Future<bool> showBottomMsg(context, msg) async{
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: bc.height(percentage: 22),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: bc.radius(topR: 40, topL: 40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                    height: 50,
                    width: 50,
                    child: Center(
                        child: Icon(Icons.mark_chat_unread_sharp,
                            color:  Colors.black))),
                Text(
                  msg,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 10,),
                FlatButton(onPressed: (){
                  Navigator.pop(context,true);
                }, child: Text("OK"))
              ],
            ),
          );
        });
  }
}

Future<int> showBottomEditOption(context) async{
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: bc.height(percentage: 35),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: bc.radius(topR: 40, topL: 40)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Text(
                  'Choose profile action',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 10,),
                ListTile(title: Text('Edit Profile'),
                subtitle: Text('Make changes in profile',style: TextStyle(fontSize: 10),),
                trailing: Icon(Icons.arrow_right),
                  leading: Icon(Icons.edit_outlined),
                  onTap: (){
                    Navigator.pop(context,1);
                  },
                ),
                ListTile(

                  title: Text('Inactive Profile',style: TextStyle(color: Colors.red[400]),),
                  subtitle: Text('Inactive profile for short time',style: TextStyle(fontSize: 10),),
                  leading: Icon(Icons.edit_attributes,color: Colors.red[400],),
                  onTap: (){
                    Navigator.pop(context,2);
                  },
                ),
                ListTile(title: Text('Permanent Delete Profile',style: TextStyle(color: Colors.red[700]),),
                  subtitle: Text('Delete your all profile data permanently',style: TextStyle(fontSize: 10),),

                  leading: Icon(Icons.delete,color: Colors.red[700]),
                  onTap: (){
                    Navigator.pop(context,3);
                  },
                )

              ],
            ),
          ),
        );
      });
}


class BottomProgress {
  void dismiss(context) {
    Navigator.of(context, rootNavigator: true).pop(true);
  }

  showBottomProgress(context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: bc.height(percentage: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: bc.radius(topR: 40, topL: 40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator()),
                SizedBox(height: 4,),
                Text("Loading")
              ],
            ),
          );
        });
  }
}


getAge( String dob)  {

  var date  = DateTime.parse("${dob.trim()} 11:11:11");
  return "${DateTime.now().difference(date).inDays~/365}";
}

formatDate( String dob)  {


  var date  = DateTime.parse("${dob.trim()}");
  return "${date.day}-${date.month}-${date.year}";
}


