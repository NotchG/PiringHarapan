import 'dart:convert';

import 'package:piring_harapan/pemerintah/data/staff_api.dart';
import 'package:piring_harapan/pemerintah/model/staff_data_model.dart';

class StaffDataDetailsController {
  static Future<List<StaffDataModel>> getStaffsBasedOnGroupIDAndName({required int groupID, String name = ""}) async {
    try {
      final response = await StaffAPI.getStaffs();
      Iterable data = await jsonDecode(response);
      List<StaffDataModel> result = [];
      for (var e in data) {
        StaffDataModel temp = StaffDataModel.fromJson(e);
        if (temp.groupID == groupID) {
          if (name == "") {
            result.add(temp);
          } else if (temp.staffName.toLowerCase().contains(name.toLowerCase())) {
            result.add(temp);
          }
        }
      }
      return result;
    } catch (e) {
      print(e);
    }
  return [];
  }
}