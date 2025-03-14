import 'package:flutter/material.dart';
import 'package:piring_harapan/tukang_masak/model/recipe_model.dart';

class RecipePriceList extends StatelessWidget {
  final List<Ingredient> ingredients;

  const RecipePriceList({Key? key, required this.ingredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = ingredients.fold(0, (sum, ingredient) => sum + ingredient.price);

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
                    Text(ingredient.name,
                        style: TextStyle(fontSize: 16)),
                    Text(
                      "Rp${(ingredient.price)}",
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
