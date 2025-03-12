class ProductReviewModel {
  String reviewerName;
  int rating;
  String description;

  ProductReviewModel.fromJson(Map<String, dynamic> json)
      : reviewerName = json['reviewer_name'] as String,
        rating = json['rating'] as int,
        description = json['description'] as String;
}