import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/pemerintah/view/components/common_list_button.dart';
import 'package:piring_harapan/common_components/text_search_bar.dart';
import 'package:piring_harapan/pemerintah/view/components/ingredients_fee_item_screen.dart';

class IngredientsFeeDetailScreen extends StatefulWidget {
  final String schoolName;

  const IngredientsFeeDetailScreen({super.key, required this.schoolName});

  @override
  State<IngredientsFeeDetailScreen> createState() =>
      _IngredientsFeeDetailScreenState();
}

class _IngredientsFeeDetailScreenState
    extends State<IngredientsFeeDetailScreen> {
  List<String> dates = [
    "6 January 2025",
    "7 January 2025",
    "8 January 2025",
    "9 January 2025",
    "10 January 2025",
    "11 January 2025",
  ];

  List<String> filteredDates = [];

  @override
  void initState() {
    super.initState();
    filteredDates = dates;
  }

  void filterSearch(String query) {
    setState(() {
      filteredDates = dates
          .where((date) => date.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderNavigation(text: "Ingredients Fee"),
              Text(
                widget.schoolName,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextSearchBar(
                hintText: "Search the Date",
                onChanged: filterSearch,
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredDates.length,
                  itemBuilder: (context, index) {
                    return CommonListButton(
                      text: filteredDates[index],
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IngredientsFeeItemScreen(
                              schoolName: widget.schoolName,
                              date: filteredDates[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
