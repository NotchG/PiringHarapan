import 'package:flutter/material.dart';
import 'package:piring_harapan/penerima/review_section/thank_you_page.dart';

class ReviewSection extends StatefulWidget {
  @override
  _PenerimaReviewPageState createState() => _PenerimaReviewPageState();
}

class _PenerimaReviewPageState extends State<ReviewSection> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController criticController = TextEditingController();
  final TextEditingController menuRequestController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _submitReview() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ThankYouPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("How was the Food Today?")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${selectedDate.day} ${_monthName(selectedDate.month)} ${selectedDate.year}",
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.calendar_today, color: Colors.green),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildSectionTitle("Menu"),
            _buildMenuList(
                ["Nasi Goreng Spesial", "Ayam Panggang Madu", "Pisang Tanduk"]),
            SizedBox(height: 16),
            _buildSectionTitle("Comment"),
            _buildInputField("Put your comment here.", commentController),
            SizedBox(height: 16),
            _buildSectionTitle("Critic & Recommendation"),
            _buildInputField("Put your critic here.", criticController),
            SizedBox(height: 16),
            _buildSectionTitle("Menu Request"),
            _buildInputField("Request your menu here.", menuRequestController),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _submitReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text("Submit Review",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
    );
  }

  Widget _buildMenuList(List<String> items) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map((item) => Text("• $item", style: TextStyle(fontSize: 16)))
            .toList(),
      ),
    );
  }

  Widget _buildInputField(String hint, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        maxLines: null,
        decoration: InputDecoration.collapsed(hintText: hint),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      "",
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[month];
  }
}
