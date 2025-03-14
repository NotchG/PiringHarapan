import 'package:flutter/material.dart';
import 'package:piring_harapan/tukang_masak/controller/market_section_controller.dart';
import 'package:piring_harapan/tukang_masak/model/product_model.dart';
import 'package:piring_harapan/tukang_masak/view/components/product_card.dart';
import 'package:piring_harapan/tukang_masak/view/components/store_info_card.dart';

import '../../../view/components/review_card.dart';

class ProductDetailView extends StatelessWidget {
  final ProductModel product;
  const ProductDetailView({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Color(0xff91C077),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chat,
                    color: Colors.white,
                    size: 30,
                  )
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 30,
                  )
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: 40,
                    child: Center(
                      child: Text(
                          "BUY NOW",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Image with Back Button
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.network(
                  product.productImage,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 40, // Adjust for status bar
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),

          // Product Details
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Rp${product.productPrice}/Kg',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Location Info
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.brown, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Location",
                            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Delivery Guarantee
                    Row(
                      children: [
                        const Icon(Icons.local_shipping, color: Colors.brown, size: 20),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Garansi Tiba',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '10 Maret - 15 Maret',
                              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20,),
                    StoreInfoCard(),
                    const SizedBox(height: 30),

                    // Product Description
                    const Text(
                      "Product Description",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green.shade300),
                      ),
                      child: Text(
                        "Enjoy fresh, juicy strawberries with a perfect balance of sweetness and tanginess. Packed with vitamin C and antioxidants, these berries are great for snacking, smoothies, or desserts. Sourced from high-quality farms to ensure freshness in every bite. Order now for doorstep delivery! 🚛✨",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Refund Requirement - Expandable
                    ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.green.shade300),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.green.shade300),
                      ),
                      title: const Text(
                        "Refund Requirement",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Refunds are available if the product is damaged or does not match the description. Please provide proof within 24 hours of receiving your order.",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Top 3 Category Badge
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.brown.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.emoji_events, color: Colors.brown, size: 20),
                          SizedBox(width: 8),
                          Text(
                            "Top 3 in Strawberry Category",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // Rating and Reviews Count
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Review",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.thumb_up, color: Colors.green, size: 20),
                                    const SizedBox(width: 6),
                                    const Text(
                                      "Rating: 99%",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                side: const BorderSide(color: Colors.green),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("500 Reviews"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Separate Review Card
                        ReviewCard(
                          review: product.reviews.first,
                        ),
                        const SizedBox(height: 50),

                        const Text(
                          "Another Product from This Store",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        FutureBuilder(
                            future: MarketSectionController.searchProductByStoreID(storeID: product.storeId, limit: 3, shuffle: true),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  children: snapshot.data!.map((e) =>
                                      ProductCard(
                                          product: e,
                                          isBestSeller: false,
                                          onClick: () {
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => ProductDetailView(product: e)
                                            ));
                                          })
                                  ).toList(),
                                );
                              }
                              return Text("Loading");
                            }
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
