import 'package:intl/intl.dart';

class SchoolDateReviewModel {
  DateTime date;
  int likes;
  int dislikes;
  String analysis;
  String reviewerProfile;
  String reviewerName;
  String reviewerReview;
  int reviewerRating;
  String saran;

  SchoolDateReviewModel.fromJson(Map json)
    : date = DateFormat('MM/dd/yyyy').parse(json['date'] as String),
      likes = json['likes'] as int,
      dislikes = json['dislikes'] as int,
      analysis = json['analysis'] as String,
      reviewerProfile = json['reviewer_profile'] as String,
      reviewerName = json['reviewer_name'] as String,
      reviewerReview = json['reviewer_review'] as String,
      reviewerRating = json['reviewer_rating'] as int,
      saran = json['saran'] as String;
}