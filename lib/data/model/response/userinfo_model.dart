class UserInfoModel {
  int ?id;
  String ?fName;
  String ?lName;
  String ?phone;
  String ?email;
  String ?identityNumber;
  String ?identityType;
  String ?identityImage;
  String? image;
  String? password;
  String ?createdAt;
  String ?updatedAt;
  String ?authToken;

  UserInfoModel(
      { required this.id,
        required this.fName,
        required this.lName,
        required this.phone,
        required  this.email,
        required this.identityNumber,
        required this.identityType,
        required this.identityImage,
        required this.image,
        required this.password,
        required this.createdAt,
        required this.updatedAt,
        required this.authToken});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    identityNumber = json['identity_number'];
    identityType = json['identity_type'];
    identityImage = json['identity_image'];
    image = json['image'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['identity_number'] = this.identityNumber;
    data['identity_type'] = this.identityType;
    data['identity_image'] = this.identityImage;
    data['image'] = this.image;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['auth_token'] = this.authToken;
    return data;
  }
}
