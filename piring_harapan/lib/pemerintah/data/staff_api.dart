import 'package:flutter/services.dart';

class StaffAPI {

  static Future getStaffs() {
    //TODO: Change to real API
    return rootBundle.loadString('assets/data/STAFF_DATA.json');
  }

}