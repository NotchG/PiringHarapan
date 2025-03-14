import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/common_components/text_search_bar.dart';
import 'package:piring_harapan/pemerintah/view/components/financial_program_card.dart';
import 'package:piring_harapan/pemerintah/model/financial_program_model.dart';
import 'package:piring_harapan/pemerintah/view/history_section/programs_finance_section/orders_detail_screen.dart';

class IngredientsFeeItemScreen extends StatefulWidget {
  final String schoolName;
  final String date;

  const IngredientsFeeItemScreen({
    super.key,
    required this.schoolName,
    required this.date,
  });

  @override
  State<IngredientsFeeItemScreen> createState() =>
      _IngredientsFeeItemScreenState();
}

class _IngredientsFeeItemScreenState extends State<IngredientsFeeItemScreen> {
  List<FinancialProgramModel> financialPrograms = [];
  List<FinancialProgramModel> filteredPrograms = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFinancialPrograms();
  }

  // Fungsi untuk membaca JSON dan mengambil data secara acak
  Future<void> loadFinancialPrograms() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/FINANCIAL_PROGRAM.json');
      List<dynamic> jsonData = jsonDecode(response);

      // Ambil 5 data secara acak dari JSON
      final random = Random();
      List<dynamic> randomItems = List.generate(
          5, (index) => jsonData[random.nextInt(jsonData.length)]);

      setState(() {
        financialPrograms =
            randomItems.map((e) => FinancialProgramModel.fromJson(e)).toList();
        filteredPrograms = financialPrograms;
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Error loading JSON: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void filterSearch(String query) {
    setState(() {
      filteredPrograms = financialPrograms
          .where((item) => item.detailPemesanan.namaBahan
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderNavigation(text: widget.schoolName),
              Text(
                widget.date,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextSearchBar(
                hintText: "Search the Ingredients Name",
                onChanged: filterSearch,
              ),
              SizedBox(height: 20),
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : filteredPrograms.isEmpty
                        ? Center(
                            child: Text(
                              "No data available",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            itemCount: filteredPrograms.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OrdersDetailScreen(
                                        financialProgram:
                                            filteredPrograms[index],
                                      ),
                                    ),
                                  );
                                },
                                child: FinancialProgramCard(
                                  financialProgram: filteredPrograms[index],
                                  onCompleted: () => debugPrint("Selesai"),
                                ),
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
