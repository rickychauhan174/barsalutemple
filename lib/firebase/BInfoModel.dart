
import 'package:firebase_database/firebase_database.dart';

class BInfoModel {
  String ac;
  String bcity;
  String bname;
  String ifs;
  String name;

  BInfoModel();

  // constructor for firebase databases
  BInfoModel.fromMap(DataSnapshot snapshot){
    ac = snapshot.value["ac"].toString();
    bcity = snapshot.value["bcity"];
    bname  = snapshot.value["bname"];
    ifs  = snapshot.value["ifs"];
    name  = snapshot.value["name"];
  }
}