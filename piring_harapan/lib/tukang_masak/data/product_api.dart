import 'package:flutter/services.dart';

class ProductAPI {

  static Future getProducts() {
    //TODO: Change to real API
    return rootBundle.loadString('assets/data/PRODUCT_DATA.json');
  }

}