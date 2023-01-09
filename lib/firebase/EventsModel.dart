
import 'package:firebase_database/firebase_database.dart';

class EventsModel {
  String image;
  String text;

  EventsModel();

  // constructor for firebase databases
  EventsModel.fromMap(DataSnapshot snapshot){
    image = snapshot.value["image"].toString();
    text = snapshot.value["text"].toString();
  }
}