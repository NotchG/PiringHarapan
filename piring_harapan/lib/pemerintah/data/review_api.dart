import 'package:flutter/services.dart';

class ReviewAPI {
  static Future getReviews() {
    return rootBundle.loadString('assets/data/REVIEW_DATA.json');
  }
}
