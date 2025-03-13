import 'package:flutter/services.dart';

class StaffAPI {
  static Future getStaffs() {
    return rootBundle.loadString('assets/data/STAFF_DATA.json');
  }
}
