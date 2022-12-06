

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barsalutemple/util/Helper.dart';

Future<Map> myPost(String api, var param,{BuildContext context}) async {

  log("$param $api");
  var progress = BottomProgress();
  var dio = Dio();
  dio.options.connectTimeout = 4500 * 10; //45s
  dio.options.receiveTimeout = 4500 * 10;
  try {
    if(context!=null){
    progress.showBottomProgress(context);
    }
    var response = await dio.post(api, data: param);
    if(context!=null){
    progress.dismiss(context);
    }
    log("------ $response");
    return json.decode("$response");
  } catch (E) {
    if(context!=null){
      progress.dismiss(context);
    }
    print(" Dio error $E");
  }

  return null;
}