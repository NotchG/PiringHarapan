import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:piring_harapan/common_components/text_search_bar.dart';
import 'package:piring_harapan/tukang_masak/controller/market_section_controller.dart';
import 'package:piring_harapan/tukang_masak/view/components/category_card.dart';
import 'package:piring_harapan/tukang_masak/view/market_section/product_detail_section/product_detail_view.dart';

import '../components/product_card.dart';

class MarketSection extends StatefulWidget {
  const MarketSection({super.key});

  @override
  State<MarketSection> createState() => _MarketSectionState();
}

class _MarketSectionState extends State<MarketSection> {

  String? category;
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: ListView(
              children: [
                Text(
                  "What Grocery Do You Want To Shop Today?",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextSearchBar(
                        hintText: "Search the ingredients You Want",
                        onChanged: (s) {
                          setState(() {
                            category = "";
                            search = s;
                          });
                        },
                      ),
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(
                            Icons.shopping_cart_outlined
                        )
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryCard(
                          image: NetworkImage("https://cdn.britannica.com/17/196817-159-9E487F15/vegetables.jpg"),
                          onClick: () {
                            setState(() {
                              category = "vegetables";
                            });
                          },
                        isActive: category == "vegetables",
                      ),
                      CategoryCard(
                          image: NetworkImage("https://media.istockphoto.com/id/529664572/photo/fruit-background.jpg?s=612x612&w=0&k=20&c=K7V0rVCGj8tvluXDqxJgu0AdMKF8axP0A15P-8Ksh3I="),
                          onClick: () {
                            setState(() {
                              category = "fruits";
                            });
                          },
                        isActive: category == "fruits",
                      ),
                      CategoryCard(
                          image: NetworkImage("https://t3.ftcdn.net/jpg/02/26/53/80/360_F_226538033_C42p96JDNwkSdQs86Agxd1TtaVJsyJ71.jpg"),
                          onClick: () {
                            setState(() {
                              category = "meat";
                            });
                          },
                        isActive: category == "meat",
                      ),
                      CategoryCard(
                          image: NetworkImage("https://media.istockphoto.com/id/544807136/photo/various-fresh-dairy-products.jpg?s=612x612&w=0&k=20&c=U5T70bi24itoTDive1CVonJbJ97ChyL2Pz1I2kOoSRo="),
                          onClick: () {
                            setState(() {
                              category = "dairy";
                            });
                          },
                        isActive: category == "dairy",
                      ),
                      CategoryCard(
                          image: NetworkImage("https://media.istockphoto.com/id/481882305/photo/different-types-of-cereal-grains-with-ears.jpg?s=612x612&w=0&k=20&c=1cD0aYvSyQuZSCozhmBUojERS7QMmOQYOgkcpg7hcvk="),
                          onClick: () {
                            setState(() {
                              category = "grains";
                            });
                          },
                        isActive: category == "grains",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Products",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                    future: search == "" ? MarketSectionController.showAllProductsBasedOnCategory(category: category ?? "") : MarketSectionController.searchProductByName(name: search),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: snapshot.data!.map((e) => ProductCard(
                            product: e,
                            isBestSeller: false,
                            onClick: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ProductDetailView(product: e)
                              ));
                            },
                          )).toList(),
                        );
                      }
                      return Text("Loading");
                    }
                )
              ],
            ),
          ),
        )
    );
  }
}