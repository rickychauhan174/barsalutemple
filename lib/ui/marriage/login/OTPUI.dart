
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_barsalutemple/ui/marriage/apis/ApisConst.dart';
import 'package:flutter_barsalutemple/ui/marriage/apis/HitAPI.dart';
import 'package:flutter_barsalutemple/ui/marriage/user/UsersListUI.dart';
import 'package:flutter_barsalutemple/util/ColorUtil.dart';
import 'package:flutter_barsalutemple/util/Helper.dart';
import 'package:flutter_barsalutemple/util/MySession.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OTPUI extends StatefulWidget{


  final String phoneNumber;
  final String otp;
  const OTPUI({Key key, this.phoneNumber,this.otp}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return OtpState();
  }


}

class OtpState extends State<OTPUI>{

  var _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = widget.otp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP'),
        centerTitle: true,
      ),
      body: Container(
        width: context.width(),
        height: context.height(),

        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/images/heart.png'),
              Text("Verify OTP", style: TextStyle(
                  fontSize: 20
              )),
              Text('We have sent OTP on ${widget.phoneNumber}',
              style: TextStyle(fontSize: 12,color: Colors.grey[500]),),

              SizedBox(height: 50,),



              TextField(
                controller:  _controller,
                style: TextStyle(
                    fontSize: 20
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter Otp"


                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: RaisedButton(
                    color: mrgDark,
                    onPressed: () {

                    var number = _controller.text;
                    if(number.length == 4){

                      verifyOTP(number);
                    }else{
                      showBottomMsg(context, 'Enter valid OTP code');
                    }

                  },
                    child: Text("Verify OTP",style: TextStyle(color: Colors.white),),),
                ),
              )


            ],
          ),
        ),
      ),

    );
  }


  verifyOTP(otp) async{

    var param = {
      keyPhoneNumber:widget.phoneNumber,
    keyOTP : otp  };
    var response = await myPost(apiVerifyOTP, param,context: context);



    if(response!=null){

      if(response['success'] == true){
        final storage = new FlutterSecureStorage();

        await storage.write(key: SES_PHONENUMBER, value: widget.phoneNumber);
        open(context, UsersListUI());


      }else{
        showBottomMsg(context,response['message']);
      }


    }else{
      showBottomMsg(context, "Network error. Please try again");
    }





  }

}