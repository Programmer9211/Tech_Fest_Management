import 'package:tech_fest_management/const/app_const/app_keys.dart';

class UserModel {
  late String uid;
  late String phoneNumber;
  late String name;
  late String profileImage;
  late String instituteName;
  late String registrationId;
  late String courseName;
  late String githubProfile;
  late String linkdinProfile;
  late String email;
  late int eventAttended;
  late bool isProfileComplete;

  UserModel({
    required this.uid,
    required this.phoneNumber,
    required this.name,
    required this.instituteName,
    required this.registrationId,
    required this.profileImage,
    required this.eventAttended,
    required this.email,
    required this.isProfileComplete,
    required this.courseName,
    required this.githubProfile,
    required this.linkdinProfile,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json[AppKeys.uid];
    phoneNumber = json[AppKeys.phoneNumber];
    name = json[AppKeys.name];
    eventAttended = json[AppKeys.eventAttended];
    instituteName = json[AppKeys.instituteName];
    registrationId = json[AppKeys.registrationId];
    profileImage = json[AppKeys.profileImage];
    email = json[AppKeys.email];
    isProfileComplete = json[AppKeys.isProfileComplete];
    courseName = json['course_name'];
    githubProfile = json['github_profile'];
    linkdinProfile = json['linkdin_profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[AppKeys.uid] = uid;
    data[AppKeys.phoneNumber] = phoneNumber;
    data[AppKeys.name] = name;
    data[AppKeys.instituteName] = instituteName;
    data[AppKeys.registrationId] = registrationId;
    data[AppKeys.profileImage] = profileImage;
    data[AppKeys.email] = email;
    data[AppKeys.eventAttended] = eventAttended;
    data[AppKeys.isProfileComplete] = isProfileComplete;
    data['github_profile'] = githubProfile;
    data['course_name'] = courseName;
    data['linkdin_profile'] = linkdinProfile;
    return data;
  }
}
