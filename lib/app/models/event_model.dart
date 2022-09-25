class EventModel {
  late String id;
  late String eventName;
  late String eventTime;
  late List imageUrl;
  late int eventTeamSize;
  late int registrationFees;
  late String eventDescription;
  late EventContactDetails eventContactDetails;
  late String eventLocation;
  late List<int> latLong;

  EventModel({
    required this.id,
    required this.eventName,
    required this.eventTime,
    required this.imageUrl,
    required this.eventTeamSize,
    required this.eventDescription,
    required this.registrationFees,
    required this.eventContactDetails,
    required this.eventLocation,
    required this.latLong,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventName = json['event_name'];
    eventTime = json['event_time'];
    imageUrl = json['image_url'];
    eventTeamSize = json['event_team_size'];
    eventDescription = json['event_description'];
    registrationFees = json['registration_fees'];
    eventContactDetails =
        EventContactDetails.fromJson(json['event_contact_details']);
    eventLocation = json['event_location'];
    latLong = json['lat_long'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['event_name'] = eventName;
    data['event_time'] = eventTime;
    data['image_url'] = imageUrl;
    data['event_team_size'] = eventTeamSize;
    data['event_description'] = eventDescription;
    data['event_contact_details'] = eventContactDetails.toJson();
    data['event_location'] = eventLocation;
    data['lat_long'] = latLong;
    data['registration_fees'] = registrationFees;
    return data;
  }
}

class EventContactDetails {
  late int phoneNo;
  late String email;
  late String websiteLink;

  EventContactDetails({
    required this.phoneNo,
    required this.email,
    required this.websiteLink,
  });

  EventContactDetails.fromJson(Map<String, dynamic> json) {
    phoneNo = json['phone_no'];
    email = json['email'];
    websiteLink = json['website_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['phone_no'] = phoneNo;
    data['email'] = email;
    data['website_link'] = websiteLink;
    return data;
  }
}
