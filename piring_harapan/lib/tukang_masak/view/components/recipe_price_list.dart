import 'package:flutter/material.dart';

class RecipePriceList extends StatelessWidget {
  final List<Map<String, dynamic>> ingredients;

  const RecipePriceList({Key? key, required this.ingredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = ingredients.fold(0, (sum, item) {
      int price = (item["price"] is int)
          ? item["price"]
          : int.tryParse(item["price"]?.toString() ?? "0") ?? 0;

      return sum + price;
    });

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...ingredients.map((ingredient) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(ingredient["name"] ?? "Unknown",
                        style: TextStyle(fontSize: 16)),
                    Text(
                      "Rp${(ingredient["price"] is int ? ingredient["price"] : int.tryParse(ingredient["price"]?.toString() ?? "0") ?? 0)}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )),
          Divider(color: Colors.brown),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Pembayaran",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Rp$total",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
