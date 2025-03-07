import 'dart:convert';
import 'package:piring_harapan/pemerintah/data/financial_program_api.dart';
import 'package:piring_harapan/pemerintah/model/financial_program_model.dart';

class FinancialProgramController {
  static Future<List<FinancialProgramModel>> getFinancialPrograms() async {
    try {
      final response = await FinancialProgramAPI.getFinancialProgram();
      Iterable data = jsonDecode(response);
      return data.map((e) => FinancialProgramModel.fromJson(e)).toList();
    } catch (e) {
      print("Error fetching financial program data: $e");
      return [];
    }
  }
}
