import 'package:flutter_barsalutemple/ui/marriage/models/ModelUserList.dart';

class ModelSingleUser {
    String message;
    bool success;
    User users;

    ModelSingleUser({this.message, this.success, this.users});

    factory ModelSingleUser.fromJson(Map<String, dynamic> json) {
        return ModelSingleUser(
            message: json['message'], 
            success: json['success'], 
            users: json['users'] != null ? User.fromJson(json['users']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['success'] = this.success;
        if (this.users != null) {
            data['users'] = this.users.toJson();
        }
        return data;
    }
}

/*
class Users {
    String createdAt;
    String district;
    String dob;
    String education;
    String email;
    String fname;
    String fnumber;
    String fwork;
    String got;
    String height;
    int id;
    bool isverified;
    String land;
    String mgot;
    String otp;
    String phonenumber;
    String profilepicture;
    String state;
    String updatedAt;
    String username;
    String village;
    String work;

    Users({this.createdAt, this.district, this.dob, this.education, this.email, this.fname, this.fnumber, this.fwork, this.got, this.height, this.id, this.isverified, this.land, this.mgot, this.otp, this.phonenumber, this.profilepicture, this.state, this.updatedAt, this.username, this.village, this.work});

    factory Users.fromJson(Map<String, dynamic> json) {
        return Users(
            createdAt: json['createdAt'], 
            district: json['district'], 
            dob: json['dob'], 
            education: json['education'], 
            email: json['email'], 
            fname: json['fname'], 
            fnumber: json['fnumber'], 
            fwork: json['fwork'], 
            got: json['got'], 
            height: json['height'], 
            id: json['id'], 
            isverified: json['isverified'], 
            land: json['land'], 
            mgot: json['mgot'], 
            otp: json['otp'], 
            phonenumber: json['phonenumber'], 
            profilepicture: json['profilepicture'], 
            state: json['state'], 
            updatedAt: json['updatedAt'], 
            username: json['username'], 
            village: json['village'], 
            work: json['work'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['createdAt'] = this.createdAt;
        data['district'] = this.district;
        data['dob'] = this.dob;
        data['education'] = this.education;
        data['email'] = this.email;
        data['fname'] = this.fname;
        data['fnumber'] = this.fnumber;
        data['fwork'] = this.fwork;
        data['got'] = this.got;
        data['height'] = this.height;
        data['id'] = this.id;
        data['isverified'] = this.isverified;
        data['land'] = this.land;
        data['mgot'] = this.mgot;
        data['otp'] = this.otp;
        data['phonenumber'] = this.phonenumber;
        data['profilepicture'] = this.profilepicture;
        data['state'] = this.state;
        data['updatedAt'] = this.updatedAt;
        data['username'] = this.username;
        data['village'] = this.village;
        data['work'] = this.work;
        return data;
    }
}*/
