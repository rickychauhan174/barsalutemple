
class AdsModel {
  String id;
  String image;
  String url;

  AdsModel();

  // constructor for firebase databases
  AdsModel.fromMap(Map<dynamic, dynamic> map, String key){
    id = key;
    image = map["image"];
    url  = map["url"];
  }
}