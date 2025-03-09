import 'package:flutter/material.dart';

class DeliveryDetailWidget extends StatelessWidget {
  final String deliveryCode;
  final String address;
  final String recipient;
  final String date;
  final String notes;
  final double subtotal;
  final double totalPayment;

  const DeliveryDetailWidget({
    Key? key,
    required this.deliveryCode,
    required this.address,
    required this.recipient,
    required this.date,
    required this.notes,
    required this.subtotal,
    required this.totalPayment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.all(10),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Delivered"),
            _buildDetailRow("Delivery Code", deliveryCode),
            _buildDetailRow("Delivery Address", address),
            _buildDetailRow("Recipient", recipient),
            _buildDetailRow("Date", date),
            SizedBox(height: 10),
            _buildSectionTitle("Notes"),
            Text(notes, style: TextStyle(color: Colors.black54)),
            SizedBox(height: 10),
            _buildSectionTitle("Order Detail"),
            _buildDetailRow("Subtotal", "Rp ${subtotal.toStringAsFixed(0)}"),
            _buildDetailRow(
                "Total Payment", "Rp ${totalPayment.toStringAsFixed(0)}"),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, style: TextStyle(color: Colors.black54))),
        ],
      ),
    );
  }
}
