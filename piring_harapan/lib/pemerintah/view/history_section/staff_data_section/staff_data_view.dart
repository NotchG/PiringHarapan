import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/pemerintah/view/history_section/staff_data_section/staff_data_details_view.dart';

import 'package:piring_harapan/pemerintah/view/components/common_list_button.dart';

class StaffDataView extends StatelessWidget {
  const StaffDataView({super.key});

  void _navigate(BuildContext context, int groupID) {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => StaffDataDetailsView(groupID: groupID)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderNavigation(text: "Logbook"),
              Text(
                "Staff Data",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CommonListButton(
                  text: "Kitchen Manager",
                  onClick: () {
                    _navigate(context, 0);
                  }
              ),
              CommonListButton(
                  text: "Kitchen Staff",
                  onClick: () {
                    _navigate(context, 1);
                  }
              ),
              CommonListButton(
                  text: "Logistic Staff",
                  onClick: () {
                    _navigate(context, 2);
                  }
              ),
              CommonListButton(
                  text: "Nutritionist",
                  onClick: () {
                    _navigate(context, 3);
                  }
              ),
              CommonListButton(
                  text: "Program Manager",
                  onClick: () {
                    _navigate(context, 4);
                  }
              ),
              CommonListButton(
                  text: "Monitoring & Evaluation Team",
                  onClick: () {
                    _navigate(context, 5);
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
