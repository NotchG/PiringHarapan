import 'package:flutter/services.dart';

class FinancialProgramAPI {
  static Future<String> getFinancialProgram() {
    //TODO: Change to real API
    return rootBundle.loadString('assets/data/FINANCIAL_PROGRAM.json');
  }
}
