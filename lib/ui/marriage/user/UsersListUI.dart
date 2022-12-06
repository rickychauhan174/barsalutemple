
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_barsalutemple/ui/marriage/login/LoginUI.dart';
import 'package:flutter_barsalutemple/ui/marriage/models/ModelSingleUser.dart';
import 'package:flutter_barsalutemple/ui/marriage/user/ViewProfileInfoUI.dart';
import 'package:flutter_barsalutemple/util/ColorUtil.dart';
import 'package:flutter_barsalutemple/util/MySession.dart';
import 'package:flutter_barsalutemple/util/Utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../apis/ApisConst.dart';
import '../apis/HitAPI.dart';
import 'package:flutter_barsalutemple/util/Helper.dart';
import 'package:flutter_barsalutemple/ui/marriage/models/ModelUserList.dart';

class UsersListUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserUI();
  }
}

class UserUI extends State<UsersListUI> {


 var userList = List<User>();
 var _scrollController = ScrollController();
 var page = 1;
 var isLoadMore = true;


 var userInfo = User();


  @override
  void initState() {
    super.initState();
    getUserUpdatedInfo();
    getUserList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
        final storage = new FlutterSecureStorage();
        storage.read(key: SES_PHONENUMBER).then((value) {
        if(value==null){
          openWait(context, LoginUI());
        }else{

          if(userInfo.username==null){
            getUserUpdatedInfo();
          }else{

            open(context, ViewProfileInfoUI(user: userInfo,));

          }

        }

        });



      }, label: Text(userInfo.username==null?'Login':'Hi, ${userInfo.username}'),
      icon: Icon(Icons.person),
      ),
      backgroundColor: Colors.grey[50],
      appBar: AppBar(backgroundColor: mrgDark,
      centerTitle: false,
      titleSpacing: 0,
      title: Text("Ror  Marriage",style: TextStyle(fontSize: 14),),
      leading: Icon(Icons.face_sharp),
      actions: [
        Icon(Icons.search_rounded),
        SizedBox(width: 10,)

      ],
      ),


      body: userList.length==0? Center(child: context.noDataFound()):

         NotificationListener(

           child: Padding(
             padding: const EdgeInsets.all(10.0),
             child: ListView.builder(
               controller: _scrollController,
               itemBuilder: (BuildContext context, int index) {
               User user = userList[index];
               return getUserView(user);
             }  ,
             itemCount: userList.length,
             ),
           ),

           onNotification: (t){

             if(!isLoadMore) return false;

             if(t is ScrollEndNotification && t.metrics.pixels ==
                 t.metrics.maxScrollExtent){
               page = page+1;
               getUserList();

             }

             return true;
           },
         )


    );
  }


  getUserList() async{

   var response = await myPost(apiGetUsersList, {keyPage:"$page"});

   ModelUserList list = ModelUserList.fromJson(response);

   if(list.success){
   userList.addAll(list.users);
   setState(() {  });
   }else{
     isLoadMore = false;
     setState(() {

     });
   }














  }



  Widget getUserView(User user){

    return InkWell(

      onTap: (){

        open(this.context, ViewProfileInfoUI(user: user,));
      },
      child: Card(

        elevation: 0.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(28)),
                      child: Image.network("${user?.profilepicture}",
                        fit: BoxFit.cover,
                        width: 70,height: 70,)),
                  SizedBox(width: 20,),
                  Column(


                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user?.username,style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: mrgDark,fontSize: 16),),
                      Row(
                        children: [
                          Text("${user?.work} - ${user?.education}",style: TextStyle(color: Colors.grey,fontSize: 12),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("${getAge(user.dob)}yrs - ${user?.height}",style: TextStyle(color: Colors.grey,fontSize: 12),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("${(user.got)}, ${user?.village} - ${user?.state}",style: TextStyle(color: Colors.grey[900],fontSize: 12),),
                        ],
                      ),




                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${formatDate(user.createdAt)}",style: TextStyle(fontSize: 10,color: mrgDark),),
                    SizedBox(width: 10,),
                    Text("View Profile",style: TextStyle(fontSize: 10,color: mrgDark),),
                  ],
                ),
              )
            ],
          ),
        ),


      ),
    );
  }

    getUserUpdatedInfo() async{

      final storage = new FlutterSecureStorage();
      var phoneNumber = await storage.read(key: SES_PHONENUMBER);
      var response = await myPost(apiGetUserInfo, {'phonenumber':phoneNumber});

      if(response!=null ){
        ModelSingleUser user = ModelSingleUser.fromJson(response);
        userInfo = user.users;

        setState(() {});
      }


    }


}
