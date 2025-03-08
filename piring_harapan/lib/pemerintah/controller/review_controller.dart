import 'dart:convert';

import 'package:piring_harapan/pemerintah/data/review_api.dart';
import 'package:piring_harapan/pemerintah/model/school_date_review_model.dart';

import '../model/school_model.dart';

class ReviewController {
  static Future<List<SchoolModel>> getSchoolsByName({String name = ""}) async {
    try {
      final response = await ReviewAPI.getReviews();
      Iterable data = await jsonDecode(response);
      List<SchoolModel> result = [];

      for (var e in data) {
        SchoolModel temp = SchoolModel.fromJson(e['schools']);
        if (name.isEmpty || temp.schoolName.toLowerCase().contains(name.toLowerCase())) {
          result.add(temp);
        }
      }
      return result;
    } catch (e) {
      print(e);
    }
    return [];
  }

  static Future<List<SchoolDateReviewModel>> getDatesBySchoolIDAndDate({required int schoolID, DateTime? date}) async {
    try {
      final response = await ReviewAPI.getReviews();
      Iterable data = jsonDecode(response);
      Iterable? dates;
      for (var e in data) {
        if ((e['schools']['school_id'] as int) == schoolID) {
          dates = e['schools']['dates'];
        }
      }
      if (dates == null) return [];
      List<SchoolDateReviewModel> result = [];

      for (var e in dates) {
        SchoolDateReviewModel temp = SchoolDateReviewModel.fromJson(e);
        if (date == null || temp.date == date) {
          result.add(temp);
        }
      }
      return result;
    } catch (e) {
      print(e);
    }
    return [];
  }
}