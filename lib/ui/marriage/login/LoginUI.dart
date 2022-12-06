
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barsalutemple/ui/marriage/apis/ApisConst.dart';
import 'package:flutter_barsalutemple/ui/marriage/apis/HitAPI.dart';
import 'package:flutter_barsalutemple/util/ColorUtil.dart';
import 'package:flutter_barsalutemple/util/Helper.dart';
import 'package:flutter_barsalutemple/ui/marriage/login/OTPUI.dart';



class LoginUI extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
   return LoginState();
  }


}

class LoginState extends State<LoginUI>{

  var _controller = TextEditingController();





  @override
  Widget build(BuildContext context) {


    return Scaffold(
      
      appBar: AppBar(title: Text('Login'),
      centerTitle: true,
      ),

      body: Container(
        width: context.width(),
        height: context.height(),


        child: Padding(
          padding: const EdgeInsets.only(left: 40,right: 40,bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [



              Image.asset('assets/images/heart.png'),

              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text("Verify Phone Number",style: TextStyle(color: mrgLight),),
              ),

              TextField(
                controller:  _controller,
                style: TextStyle(
                    fontSize: 20
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter 10 digits phone number",
                  hintStyle: TextStyle(fontSize: 14)


                ),


              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: RaisedButton(
                    color: mrgDark,
                    onPressed: () {

                      var number = _controller.text;
                      if(number.length == 10){
                        login(_controller.text);
                      }else{
                        showBottomMsg(context,'Please enter valid phone number');
                      }

                    },
                    child: Text("Get OTP",style: TextStyle(color: Colors.white),),),
                ),
              ),



            ],
          ),
        ),
      ),

    );
  }



  login(phoneNumber) async{


  var param = {keyPhoneNumber:phoneNumber};
  var response = await myPost(apiVerifyPhoneNumber, param,context: context);



  if(response!=null){

    if(response['success'] == true){
      open(context, OTPUI(phoneNumber: phoneNumber,otp: '${response['user']['otp']}',));
    }else{
      showBottomMsg(context,response['message']);
    }
    

  }else{
    showBottomMsg(context, "Network error. Please try again");
  }





  }



}




