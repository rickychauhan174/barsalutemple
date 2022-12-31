
class PhotosModel {
  String url;

  PhotosModel();

  // constructor for firebase databases
  PhotosModel.fromMap(Map<dynamic, dynamic> map){
    url  = map["url"];
  }
}