import 'package:flutter/material.dart';
import 'package:piring_harapan/pemerintah/model/financial_program_model.dart';
import 'package:piring_harapan/pemerintah/view/history_section/programs_finance_section/orders_detail_screen.dart';

class FinancialProgramCard extends StatelessWidget {
  final FinancialProgramModel financialProgram;
  final VoidCallback onCompleted;

  const FinancialProgramCard({
    super.key,
    required this.financialProgram,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrdersDetailScreen(
              financialProgram: financialProgram,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff91C077)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "200 × 200",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    financialProgram.detailPemesanan.namaBahan,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    financialProgram.namaToko,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Harga per produk: ${financialProgram.detailPemesanan.subtotalProduk}",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Total ${financialProgram.detailPemesanan.jumlah} Produk: ${financialProgram.totalPembayaran}",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            // Complete Button
            ElevatedButton(
              onPressed: onCompleted,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff91C077),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                "Selesai",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
