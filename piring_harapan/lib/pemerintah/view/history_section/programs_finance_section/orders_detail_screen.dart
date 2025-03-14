import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/pemerintah/view/components/financial_program_detail_card.dart';
import 'package:piring_harapan/pemerintah/model/financial_program_model.dart';

class OrdersDetailScreen extends StatelessWidget {
  final FinancialProgramModel financialProgram;

  const OrdersDetailScreen({super.key, required this.financialProgram});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: HeaderNavigation(text: "Orders Detail"),
            ),

            // Order Details Card
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FinancialProgramDetailCard(
                    financialProgram: financialProgram),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
