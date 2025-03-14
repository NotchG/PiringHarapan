import 'package:flutter/material.dart';
import 'package:piring_harapan/tukang_masak/controller/ai_menu_controller.dart';
import 'package:piring_harapan/tukang_masak/view/components/balance_coin_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/review_notification_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/ask_bot_button_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/product_item_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/feedback_card_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/more_button_widget.dart';
import 'package:piring_harapan/tukang_masak/view/home_section/bot_chat_page.dart';
import 'package:piring_harapan/tukang_masak/view/home_section/review_page.dart';
import 'package:piring_harapan/tukang_masak/view/home_section/ai_menu_recommendation.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  List<Map<String, String>> messages = [
    {"role": "system", "content": "Return an array of json with exactly 3 items using this format\n\n{\n  \"menu\": {\n    \"name\": \"Spaghetti Carbonara\",\n    \"ingredients\": [\n      { \"name\": \"Spaghetti\", \"quantity\": \"200g\", \"price\": \"20000\" },\n      { \"name\": \"Eggs\", \"quantity\": \"2\", \"price\": \"20000\" },\n      { \"name\": \"Pancetta\", \"quantity\": \"100g\", \"price\": \"20000\" },\n      { \"name\": \"Parmesan Cheese\", \"quantity\": \"50g\", \"price\": \"20000\" },\n      { \"name\": \"Black Pepper\", \"quantity\": \"to taste\", \"price\": \"20000\" },\n      { \"name\": \"Salt\", \"quantity\": \"to taste\", \"price\": \"20000\" },\n      { \"name\": \"Garlic\", \"quantity\": \"1 clove\", \"price\": \"20000\" }\n    ],\n    \"steps\": {\n      \"preparation\": [\n        \"Chop the pancetta into small cubes.\",\n        \"Grate the Parmesan cheese.\",\n        \"Crack the eggs into a bowl and beat them.\",\n        \"Mince the garlic.\"\n      ],\n      \"cooking\": [\n        \"Boil water and add salt, then cook the spaghetti until al dente.\",\n        \"In a pan, cook the pancetta with garlic until crispy.\",\n        \"Drain the spaghetti and add it to the pan with pancetta.\",\n        \"Remove from heat, add beaten eggs and Parmesan, stirring quickly to create a creamy sauce.\",\n        \"Season with black pepper and mix well.\"\n      ],\n      \"serving\": [\n        \"Plate the spaghetti and sprinkle extra Parmesan on top.\",\n        \"Serve immediately while hot.\"\n      ]\n    }\n  }\n}\n\nand follow this format exactly, don't make any changes just follow the format"},
    {"role": "user", "content": "recommend menu that is budget and children friendly"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back,\nDiana Asmirati!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                BalanceCoinWidget(
                  balance: 500000,
                  coin: 30000,
                ),
                SizedBox(height: 16),
                ReviewNotificationWidget(
                  sellerName: "Dedeng Herman",
                  onAddReview: () {
                    print("Tombol Add Review Ditekan!");
                  },
                ),
                SizedBox(height: 16),
                Text(
                  "AI Menu Recommendation",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                AskBotButtonWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BotChatPage(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                FutureBuilder(
                    future: AiMenuController().fetchChatCompletion(messages),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Text("AI is working...");
                      }
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      if (snapshot.hasData) {
                        return Column(
                          children: snapshot.data!.map((e) =>
                              ProductItemWidget(
                                imagePath: "assets/img/bakwan.png",
                                productName: e.name,
                                price: e.ingredients.fold(0, (sum, itemAmount) => sum + itemAmount.price),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AiMenuRecommendationPage(
                                        menuName: e.name,
                                        ingredients: e.ingredients,
                                        steps: [
                                          {
                                            "title": "Ingredients Preparation",
                                            "content": e.steps.preparation
                                          },
                                          {
                                            "title": "Cooking",
                                            "content": e.steps.cooking
                                          },
                                          {
                                            "title": "Serving",
                                            "content": e.steps.serving
                                          },
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                          ).toList(),
                        );
                      }
                      return Text("AI is not working...");
                    }
                ),
                SizedBox(height: 8),
                Center(
                  child: MoreButtonWidget(
                    onTap: () {
                      setState(() {

                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Food Feedback",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                FeedbackCardWidget(
                  name: "Gilang Amarah",
                  imagePath: "assets/img/gilang amarah.png",
                  feedback:
                  "Hari ini, makanan yang disajikan memiliki masalah serius. Ayam goreng yang diberikan masih belum matang dengan bagian dalam yang masih merah dan berdarah...",
                  rating: 0.11,
                ),
                SizedBox(height: 8),
                Center(
                  child: MoreButtonWidget(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReviewPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
