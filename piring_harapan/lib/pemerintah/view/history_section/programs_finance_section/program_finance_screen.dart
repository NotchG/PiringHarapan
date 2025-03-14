import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/pemerintah/view/components/common_list_button.dart';
import 'package:piring_harapan/pemerintah/view/history_section/programs_finance_section/ingredients_fee_screen.dart';

class ProgramFinanceScreen extends StatelessWidget {
  const ProgramFinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderNavigation(text: "Logbook"),
              Text(
                "Program Finance",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              CommonListButton(
                text: "Ingredients Fee",
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IngredientsFeeScreen()));
                },
              ),
              CommonListButton(
                text: "Employees Payment",
                onClick: () {
                  debugPrint("Employees Payment clicked");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
