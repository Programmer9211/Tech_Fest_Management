import 'package:tech_fest_management/const/app_const/app_keys.dart';

class UserModel {
  late String uid;
  late String institueId;
  late String name;
  late String profileImage;
  late String instituteName;
  late String registrationId;
  late String email;
  late int eventAttended;
  late bool isProfileComplete;

  UserModel({
    required this.uid,
    required this.institueId,
    required this.name,
    required this.instituteName,
    required this.registrationId,
    required this.profileImage,
    required this.eventAttended,
    required this.email,
    required this.isProfileComplete,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json[AppKeys.uid];
    institueId = json[AppKeys.institueId];
    name = json[AppKeys.name];
    eventAttended = json[AppKeys.eventAttended];
    instituteName = json[AppKeys.instituteName];
    registrationId = json['registration_id'];
    profileImage = json['profile_image'];
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
    data['profile_image'] = profileImage;
    data['email'] = email;
    data[AppKeys.eventAttended] = eventAttended;
    data[AppKeys.isProfileComplete] = isProfileComplete;
    return data;
  }
}
