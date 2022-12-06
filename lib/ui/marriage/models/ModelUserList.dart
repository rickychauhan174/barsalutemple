class ModelUserList {
    String message;
    bool success;
    List<User> users;

    ModelUserList({this.message, this.success, this.users});

    factory ModelUserList.fromJson(Map<String, dynamic> json) {
        return ModelUserList(
            message: json['message'], 
            success: json['Success'],
            users: json['users'] != null ? (json['users'] as List).map((i) => User.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['Success'] = this.success;
        if (this.users != null) {
            data['users'] = this.users.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class User {
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
    String mgot;
    String otp;
    String phonenumber;
    String profilepicture;
    String updatedAt;
    String username;
    String village;
    String work;

    String land;
    String state;


    User({
        this.land,
        this.state,
        this.createdAt, this.district, this.dob, this.education, this.email, this.fname, this.fnumber, this.fwork, this.got, this.height, this.id, this.isverified, this.mgot, this.otp, this.phonenumber, this.profilepicture, this.updatedAt, this.username, this.village, this.work});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            state: json['state'],
            land: json['land'],
            createdAt: json['createdAt'], 
            district: json['district'] != null ? (json['district']) : null,
            dob: json['dob'] != null ? (json['dob']) : null,
            education: json['education'] != null ? (json['education']) : null,
            email: json['email'] != null ? (json['email']) : null,
            fname: json['fname'] != null ? (json['fname']) : null,
            fnumber: json['fnumber'] != null ? (json['fnumber']) : null,
            fwork: json['fwork'] != null ? (json['fwork']) : null,
            got: json['got'] != null ? (json['got']) : null,
            height: json['height'] != null ? (json['height']) : null,
            id: json['id'], 
            isverified: json['isverified'], 
            mgot: json['mgot'] != null ? (json['mgot']) : null,
            otp: json['otp'], 
            phonenumber: json['phonenumber'], 
            profilepicture: json['profilepicture'] != null ? (json['profilepicture']) : null,
            updatedAt: json['updatedAt'], 
            username: json['username'] != null ? (json['username']) : null,
            village: json['village'] != null ? (json['village']) : null,
            work: json['work'] != null ? (json['work']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['createdAt'] = this.createdAt;
        data['land'] = this.land;
        data['state'] = this.state;
        data['id'] = this.id;
        data['isverified'] = this.isverified;
        data['otp'] = this.otp;
        data['phonenumber'] = this.phonenumber;
        data['updatedAt'] = this.updatedAt;
        if (this.district != null) {
            data['district'] = this.district;
        }
        if (this.dob != null) {
            data['dob'] = this.dob;
        }
        if (this.education != null) {
            data['education'] = this.education;
        }
        if (this.email != null) {
            data['email'] = this.email;
        }
        if (this.fname != null) {
            data['fname'] = this.fname;
        }
        if (this.fnumber != null) {
            data['fnumber'] = this.fnumber;
        }
        if (this.fwork != null) {
            data['fwork'] = this.fwork;
        }
        if (this.got != null) {
            data['got'] = this.got;
        }
        if (this.height != null) {
            data['height'] = this.height;
        }
        if (this.mgot != null) {
            data['mgot'] = this.mgot;
        }
        if (this.profilepicture != null) {
            data['profilepicture'] = this.profilepicture;
        }
        if (this.username != null) {
            data['username'] = this.username;
        }
        if (this.village != null) {
            data['village'] = this.village;
        }
        if (this.work != null) {
            data['work'] = this.work;
        }
        return data;
    }
}