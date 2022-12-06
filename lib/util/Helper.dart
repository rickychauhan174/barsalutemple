
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const appColor = Colors.blue;
const errorMsg = "Network error. please try again";

extension sizeInfo on BuildContext {
  double height({percentage = 100}) =>
      MediaQuery.of(this).size.height * (percentage / 100);

  double width({percentage = 100}) =>
      MediaQuery.of(this).size.width * (percentage / 100);

  BorderRadius radius(
          {double topL = 0,
          double bottomL = 0,
          double topR = 0,
          double bottomR = 0}) =>
      BorderRadius.only(
        topRight: Radius.circular(topR),
        bottomRight: Radius.circular(bottomR),
        bottomLeft: Radius.circular(bottomL),
        topLeft: Radius.circular(topL),
      );


  Widget loading() {
    return Center(
        child: SizedBox(
            width: 30, height: 30, child: CircularProgressIndicator()));
  }

  Widget noDataFound() {
    return SizedBox( height: 80, child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.pin_drop_sharp,color: Colors.grey,size: 30,),
        SizedBox(height: 5,),
        Text("No data found",style: TextStyle(color: Colors.grey,),),
      ],
    ));
  }
}

openReplace(BuildContext context, Widget whichIsOpen) {
  Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => whichIsOpen));
}

open(BuildContext context, Widget whichIsOpen) {
  Navigator.push(
      context, CupertinoPageRoute(builder: (context) => whichIsOpen));
}

Future openWait(BuildContext context, Widget whichIsOpen) async {
  final result = await Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => whichIsOpen),
  );

  return result;
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                SizedBox(height: 10,),
                Text(
                  msg,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,fontSize: 22),
                ),
                SizedBox(height: 30,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FlatButton(
                        color: Colors.yellow[800],
                        onPressed: (){

                      Navigator.pop(context,true);
                    }, child: Text("OK")),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

Future<bool> showBottomMsgWithAction(context,msg,{String actionText = "OK", String dismissText = "Dismiss"}) async{
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
                      child: Icon(Icons.logout,
                          color:  Colors.black))),
              Text(
                msg,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(onPressed: (){
                    Navigator.pop(context,true);
                  }, child: Text(actionText,style: TextStyle(color: appColor[400]))),
                  FlatButton(onPressed: (){
                    Navigator.pop(context,false);
                  }, child: Text(dismissText,style: TextStyle(color: Colors.red[400]),))
                ],
              )
            ],
          ),
        );
      });
}



Future<String> showBottomField(BuildContext context, msg, {actionText = "Done",isCap = true})
{
  var controller = TextEditingController();

  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(

            padding: MediaQuery.of(context).viewInsets
         ,
          child: Container(
            height: context.height(percentage: 30),
            decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: context.radius(topR: 40, topL: 40)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  TextField(
                    textAlign: TextAlign.center,
                    cursorColor: appColor,
                    textCapitalization: isCap?TextCapitalization.characters:TextCapitalization.none,
                    decoration: InputDecoration(hintText: msg),
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),
                    controller: controller,),
                  SizedBox(height: 20,),

                  FlatButton(
                    minWidth: context.width(),
                      color: appColor,
                      onPressed: (){

                    Navigator.pop(context,controller.text);

                  }, child: Text(actionText,style: TextStyle(color: Colors.white,fontSize: 18),))
                ],
              ),
            ),
          ),
        );
      });
}






Widget getTile(String title, IconData icon) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(fontSize: 15),
    ),
    leading: Icon(
      icon,
      color: appColor,
    ),
  );
}

Widget infoView({String title, String value}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,style: TextStyle(fontSize: 10,color: Colors.grey),),
      Text(value,style: TextStyle(fontSize: 14),),
    ],
  );
}


class ModelTitleID {
  String name;
  String description;
  String id;

  ModelTitleID({this.name, this.description, this.id});
}

Future<ModelTitleID> showBottomList(context, List<ModelTitleID> list,{String title }) async {

  List<ModelTitleID> newList= list;
  return showModalBottomSheet(
      isScrollControlled: true,

      backgroundColor: Colors.transparent,
      context: context,

      builder: (BuildContext bc) {

        int bottomSheetSize = list.length*10;
        print(bottomSheetSize);
        return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {

          return Container(
            height: bc.height(percentage: bottomSheetSize<100?bottomSheetSize:90)+40,

            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(color: appColor,width: 1)),
                color: Colors.white, borderRadius: bc.radius(topR: 40, topL: 40)),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView(
                children: [
                  Visibility(
                    visible: list.length>12,
                    child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          child: TextField(

                            onChanged: (value){
                              setState(() {
                                newList = list
                                    .where((data) => data.name.toLowerCase().contains(value.toLowerCase()))
                                    .toList();
                              });


                            },
                            decoration: InputDecoration(hintText: "Search",
                                prefixIcon: Icon(Icons.search)
                            ),
                          ),
                        )),
                  ),
                  Visibility(
                    visible: title!=null,
                    child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                          child: Stack(

                            alignment: Alignment.center,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },

                                      child: Icon(Icons.arrow_back_sharp,color: Colors.grey[600],))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(title,style: TextStyle(fontSize: 20),)),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                      onTap: (){
                                        showBottomMsg(context, "Village location feature will coming very soon. Sorry for inconvenience");
                                      },
                                      child: Icon(Icons.navigation,color: Colors.green,))),
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Divider(),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      ModelTitleID tile = newList[index];

                      return InkWell(
                        onTap: (){
                          Navigator.pop(context,tile);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tile?.name?? "-----",
                                style: TextStyle(fontSize: 18),
                              ),
                              Visibility(
                                visible: tile.description != null,
                                child: Text(
                                  tile?.description?? "-",
                                  style: TextStyle(fontSize: 12,color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: newList.length,
                  ),
                ],
              ),
            ),
          );

        },




        );
      });
}
