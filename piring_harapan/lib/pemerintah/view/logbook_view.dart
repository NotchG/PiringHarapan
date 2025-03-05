import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/view/components/common_list_button.dart';
import 'package:piring_harapan/pemerintah/view/staff_data_view.dart';
import 'package:piring_harapan/pemerintah/view/ingredients_data_view.dart';

class LogbookView extends StatelessWidget {
  const LogbookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Logbook",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CommonListButton(
                  text: "Staff Data",
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StaffDataView()));
                  }),
              CommonListButton(
                  text: "Ingredients",
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IngredientsDataView()));
                  }),
              CommonListButton(text: "Menu", onClick: () {}),
              CommonListButton(text: "Review", onClick: () {}),
              CommonListButton(text: "Programs Finance", onClick: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
