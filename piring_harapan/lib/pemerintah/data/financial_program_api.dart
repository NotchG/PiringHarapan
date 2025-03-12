import 'package:flutter/services.dart';

class FinancialProgramAPI {
  static Future<String> getFinancialProgram() {
    return rootBundle.loadString('assets/data/FINANCIAL_PROGRAM.json');
  }
}
