import 'package:piring_harapan/tukang_masak/model/product_review_model.dart';

class ProductModel {
  String productId;
  String productName;
  String productImage;
  int productPrice;
  String productCategory;
  String storeId;
  List<ProductReviewModel> reviews;

  ProductModel.fromJson(Map<String, dynamic> json)
      : productId = json['product_id'] as String,
        productName = json['product_name'] as String,
        productImage = json['product_image'] as String,
        productPrice = json['product_price'] as int,
        productCategory = json['product_category'] as String,
        storeId = json['store_id'] as String,
        reviews = (json['review'] as List)
            .map((reviewJson) => ProductReviewModel.fromJson(reviewJson))
            .toList();
}