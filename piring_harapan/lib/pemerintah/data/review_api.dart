import 'package:flutter/services.dart';

class ReviewAPI {
  static Future getReviews() {
    //TODO: Change to real API
    return rootBundle.loadString('assets/data/REVIEW_DATA.json');
  }
}