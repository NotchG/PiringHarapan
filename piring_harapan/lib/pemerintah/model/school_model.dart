import 'package:piring_harapan/pemerintah/model/school_date_review_model.dart';

class SchoolModel {
  int schoolID;
  String schoolName;

  SchoolModel.fromJson(Map json)
    : schoolID = json['school_id'] as int,
      schoolName = json['school_name'] as String;
}