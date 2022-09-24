import 'package:tech_fest_management/const/app_const/app_keys.dart';

class UserModel {
  late String uid;
  late String institueId;
  late String name;
  late String instituteName;
  late String registrationId;
  late String email;
  late bool isProfileComplete;

  UserModel({
    required this.uid,
    required this.institueId,
    required this.name,
    required this.instituteName,
    required this.registrationId,
    required this.email,
    required this.isProfileComplete,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json[AppKeys.uid];
    institueId = json[AppKeys.institueId];
    name = json[AppKeys.name];
    instituteName = json[AppKeys.instituteName];
    registrationId = json['registration_id'];
    email = json['email'];
    isProfileComplete = json['is_profile_complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid;
    data['institue_id'] = institueId;
    data['name'] = name;
    data['institute_name'] = instituteName;
    data['registration_id'] = registrationId;
    data['email'] = email;
    data[''] = isProfileComplete;
    return data;
  }
}
