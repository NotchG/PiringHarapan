class StaffDataModel {
  String staffID;
  String staffName;
  int groupID;
  String staffLocation;
  String staffProfilePicture;

  StaffDataModel.fromJson(Map json)
      : staffID = json['staff_id'] as String,
        staffName = json['staff_name'] as String,
        groupID = json['group_id'] as int,
        staffLocation = json['staff_location'] as String,
        staffProfilePicture = json['staff_profile_picture'] as String;
}
