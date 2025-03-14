import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';

class DeliveryDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderNavigation(text: "Delivery Received"),
              _buildSectionTitle("Delivered", isGreen: true),
              _buildInfoCard([
                _buildDetailRow("Deliver Code", "DS08032025"),
                _buildBoldDetail("Delivery Address",
                    "Jl. Melati No. 12, Kelurahan Cihapit, Kecamatan Bandung Wetan, Kota Bandung, Jawa Barat, 40114, Indonesia."),
                _buildDetailRow("Date", "2025-01-01"),
                _buildDetailRow("Type of ingredients", "Beras"),
                _buildDetailRow("Quantity", "5 kg"),
                _buildDetailRow("Recipient name", "Diana Asmirati"),
              ]),
              _buildSectionTitle("Notes"),
              _buildInfoCard([
                Text(
                  "“Digunakan sebagai pendamping makanan dari menu utama, yaitu Kangkung Tumis.”",
                  style: TextStyle(color: Colors.black54),
                ),
              ]),
              _buildSectionTitle("Order Detail"),
              _buildInfoCard([
                _buildDetailRow("# Order Number", "BS10000830205"),
                _buildDetailRow("Payment Method", "BCA Mobile"),
                _buildDetailRow("Payment Time", "31 December 2024"),
                Divider(color: Colors.grey[300]),
                _buildOrderItem("Beras", "x5", "Rp 19.000"),
                Divider(color: Colors.grey[300]),
                _buildDetailRow("Subtotal for Product", "Rp 95.000"),
                _buildDetailRow("Subtotal Delivery", "Rp 10.000"),
                _buildDetailRow(
                  "Total Payment",
                  "Rp 105.000",
                  isBold: true,
                  isGreen: true,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, {bool isGreen = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isGreen ? Colors.green[700] : Colors.black,
        ),
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green[200]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildDetailRow(String title, String value,
      {bool isBold = false, bool isGreen = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: isGreen ? Colors.green[700] : Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoldDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title:", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 2),
          Text(value, style: TextStyle(fontSize: 14, color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildOrderItem(String name, String quantity, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(quantity, style: TextStyle(color: Colors.black54)),
          Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
