import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/pemerintah/view/components/common_list_button.dart';
import 'package:piring_harapan/common_components/text_search_bar.dart';
import 'ingredients_fee_detail_screen.dart';

class IngredientsFeeScreen extends StatefulWidget {
  const IngredientsFeeScreen({super.key});

  @override
  State<IngredientsFeeScreen> createState() => _IngredientsFeeScreenState();
}

class _IngredientsFeeScreenState extends State<IngredientsFeeScreen> {
  List<String> schools = [
    "SDN Harapan Jaya",
    "SD Pelita Bangsa",
    "SD Tunas Ilmu",
    "SD Alam Sejahtera",
    "SMP Nusantara 1",
    "SMP Bhakti Luhur"
  ];

  List<String> filteredSchools = [];

  @override
  void initState() {
    super.initState();
    filteredSchools = schools;
  }

  void filterSearch(String query) {
    setState(() {
      filteredSchools = schools
          .where((school) => school.toLowerCase().contains(query.toLowerCase()))
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
              HeaderNavigation(text: "Program Finance"),
              Text(
                "Ingredients Fee",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextSearchBar(
                hintText: "Search the School Name",
                onChanged: filterSearch,
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredSchools.length,
                  itemBuilder: (context, index) {
                    return CommonListButton(
                      text: filteredSchools[index],
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IngredientsFeeDetailScreen(
                              schoolName: filteredSchools[index],
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
