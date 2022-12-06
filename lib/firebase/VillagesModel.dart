
class VillagesModel {
  String id;
  String dist;
  String gotra;
  String name;
  String state;
  String location;


  VillagesModel();

  // constructor for firebase databases
  VillagesModel.fromMap(Map<dynamic, dynamic> map, String key){
    id = key;
    dist = map["dist"];
    gotra  = map["gotra"];
    name  = map["name"];
    state  = map["state"];
    location  = map["loc"];
  }
}