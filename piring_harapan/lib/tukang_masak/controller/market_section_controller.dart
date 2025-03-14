import 'dart:convert';
import 'dart:math';

import '../data/product_api.dart';
import '../model/product_model.dart';

class MarketSectionController {
  // Function to retrieve all products or filter by category
  static Future<List<ProductModel>> showAllProductsBasedOnCategory({String category = ""}) async {
    try {
      final response = await ProductAPI.getProducts();
      Iterable data = await jsonDecode(response);
      List<ProductModel> result = [];

      for (var e in data) {
        ProductModel product = ProductModel.fromJson(e);
        if (category == "") {
          // If no category is specified, add all products
          result.add(product);
        } else if (product.productCategory.toLowerCase() == category.toLowerCase()) {
          // Add only products matching the specified category
          result.add(product);
        }
      }
      return result;
    } catch (e) {
      print(e);
    }
    return [];
  }

  // Function to retrieve a specific product by its ID
  static Future<ProductModel?> getProductByID({required String id}) async {
    try {
      final response = await ProductAPI.getProducts();
      Iterable data = await jsonDecode(response);

      for (var e in data) {
        ProductModel product = ProductModel.fromJson(e);
        if (product.productId == id) {
          // Return the product if ID matches
          return product;
        }
      }
      return null; // Return null if no product with matching ID is found
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Function to search products by name
  static Future<List<ProductModel>> searchProductByName({required String name}) async {
    try {
      final response = await ProductAPI.getProducts();
      Iterable data = await jsonDecode(response);
      List<ProductModel> result = [];

      for (var e in data) {
        ProductModel product = ProductModel.fromJson(e);
        if (product.productName.toLowerCase().contains(name.toLowerCase())) {
          // Add products whose names contain the search term
          result.add(product);
        }
      }
      return result;
    } catch (e) {
      print(e);
    }
    return [];
  }

  static Future<List<ProductModel>> searchProductByStoreID({
    required String storeID,
    int? limit,
    bool shuffle = false
  }) async {
    try {
      final response = await ProductAPI.getProducts();
      Iterable data = await jsonDecode(response);
      List<ProductModel> result = [];

      for (var e in data) {
        ProductModel product = ProductModel.fromJson(e);
        if (product.storeId == storeID) {
          // Add products that match the store ID
          result.add(product);
        }
      }

      // Shuffle the results if requested
      if (shuffle && result.isNotEmpty) {
        result.shuffle(Random());
      }

      // Apply limit if specified
      if (limit != null && limit < result.length) {
        result = result.sublist(0, limit);
      }

      return result;
    } catch (e) {
      print(e);
    }
    return [];
  }
}