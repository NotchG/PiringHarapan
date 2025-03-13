import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/model/financial_program_model.dart';

class FinancialProgramDetailCard extends StatelessWidget {
  final FinancialProgramModel financialProgram;

  const FinancialProgramDetailCard({super.key, required this.financialProgram});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xffd4e7c5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "Pesanan Selesai",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Kode Pengiriman: ${financialProgram.kodePengiriman}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _buildSectionTitle("Alamat Pengiriman"),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.black54, size: 16),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  financialProgram.alamatPengiriman,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          _buildBoxContainer(
            "Catatan Pemesanan",
            Text(financialProgram.catatanPemesanan),
          ),
          SizedBox(height: 10),
          _buildBoxContainer(
            "Detail Pemesanan",
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow(Icons.receipt, "Nomor Pesanan",
                    financialProgram.nomorPesanan),
                _buildDetailRow(Icons.payment, "Metode Pembayaran",
                    financialProgram.metodePembayaran),
                _buildDetailRow(Icons.access_time, "Waktu Pembayaran",
                    financialProgram.waktuPembayaran),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  financialProgram.detailPemesanan.namaBahan,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                _buildPriceRow(
                    "${financialProgram.detailPemesanan.namaBahan} x${financialProgram.detailPemesanan.jumlah}",
                    financialProgram.detailPemesanan.subtotalProduk),
                _buildPriceRow("Subtotal untuk Produk",
                    financialProgram.detailPemesanan.subtotalProduk),
                _buildPriceRow(
                    "Subtotal Pengiriman", financialProgram.subtotalPengiriman),
                Divider(),
                _buildPriceRow(
                    "Total Pembayaran", financialProgram.totalPembayaran,
                    isBold: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildBoxContainer(String title, Widget content) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          content,
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.black54),
          SizedBox(width: 5),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 5),
          Expanded(child: Text(value, style: TextStyle(color: Colors.black54))),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
