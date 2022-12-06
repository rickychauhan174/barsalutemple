
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_barsalutemple/ui/marriage/models/ModelUserList.dart';
import 'package:flutter_barsalutemple/ui/marriage/user/CreateMarriageProfile.dart';
import 'package:flutter_barsalutemple/util/ColorUtil.dart';
import 'package:flutter_barsalutemple/util/Helper.dart';
import 'package:flutter_barsalutemple/util/MySession.dart';
import 'package:flutter_barsalutemple/util/Utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ViewProfileInfoUI extends StatefulWidget {

  final User user;

  const ViewProfileInfoUI({Key key, this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<ViewProfileInfoUI> {

  final storage = FlutterSecureStorage();
  bool isMyProfile = false;

  @override
  void initState() {

    super.initState();

    storage.read(key: SES_PHONENUMBER).then((value) {

      isMyProfile = (value==widget.user.phonenumber);
      setState(() {});
    });


  }


  @override
  Widget build(BuildContext context) {

    User user = widget.user;

    return Scaffold(

      floatingActionButton: FloatingActionButton.extended(label: Text(
          isMyProfile?'Edit'
          :'Contact'),
        onPressed: () {
          showBottomEditOption(context).then((value) {

            print(value);
            if(value!=null){
              switch(value){

                case 1:
                  open(context, CreateMarriageProfile(objUser: user,));
                  break;



              }


            }


          });

        },
        backgroundColor: mrgDark,

        icon: Icon(isMyProfile?Icons.edit:Icons.call,size: 18,),
      ),
      body: CustomScrollView(
        slivers: [

          SliverAppBar(

            actions: [
              Visibility(
                  visible: isMyProfile,
                  child: InkWell(
                      onTap: (){

                        if(isMyProfile){
                          showBottomMsgWithAction(context, 'Do you want to logout?',
                          actionText: 'Logout'
                          );
                        }

                      },
                      child: Icon(Icons.logout,color: Colors.red,))),
              SizedBox(width: 20,)


            ],

            flexibleSpace: Container(

              decoration: BoxDecoration(image: DecorationImage(
                image: NetworkImage(widget.user.profilepicture)

              )),

            ),
            expandedHeight: 200,

          ),
          SliverPadding(
            padding: const EdgeInsets.all(30.0),
            sliver: SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${user.username} ${user.got}",style: TextStyle(fontSize: 22),),
                      Text("${getAge(user.dob)}yrs",style: TextStyle(color: mrgDark,fontWeight: FontWeight.w600),)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text("ABOUT ${user.username}",style: TextStyle(fontSize: 12,
                        color: mrgLight,
                        fontWeight: FontWeight.w700),),
                  ),
                  getText('Work/Education',"${user.work} - ${user.education}"),
                  getText('Age/Height',"${getAge(user.dob)}yrs - ${user.height}"),
                  getText('Gotra/Village',"${user.got} - ${user.village} ${user.district} ${user.state}"),
                  getText('Land',"${user.land} acers"),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text("Family Information",style: TextStyle(fontSize: 12,
                        color: mrgLight,
                        fontWeight: FontWeight.w700),),
                  ),
                  getText('Father/Parent Name',"${user.fname}"),
                  getText('Work',"${user.fwork}"),
                  getText('Contact',"${user.fnumber}"),
                  getText('Mother Gotra',"${user.mgot}"),

                ],
              ),

            ),
          )


        ],

      ),

    );
  }
  
  
  
  Widget getText(String title,String text){
    return Padding(
      padding: const EdgeInsets.only(top: 12,left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(fontSize: 10),),
          Text(text),
        ],
      ),
    );
  }
}
