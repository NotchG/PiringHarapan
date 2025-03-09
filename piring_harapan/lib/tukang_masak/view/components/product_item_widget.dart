import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  final String imagePath;
  final String productName;
  final int price;
  final VoidCallback? onTap; // Tambahkan onTap sebagai parameter opsional

  const ProductItemWidget({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.price,
    this.onTap, // Bisa null jika tidak ingin aksi ketika diklik
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Jalankan onTap jika tidak null
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // **Gambar Produk**
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 12),

            // **Detail Produk**
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Rp${price.toString().replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => "${m[1]}.",
                      )}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
