import 'package:flutter/material.dart';
import 'package:piring_harapan/tukang_masak/view/components/balance_coin_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/review_notification_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/ask_bot_button_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/product_item_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/feedback_card_widget.dart';
import 'package:piring_harapan/tukang_masak/view/components/more_button_widget.dart';
import 'package:piring_harapan/tukang_masak/view/home_section/bot_chat_page.dart';
import 'package:piring_harapan/tukang_masak/view/home_section/review_page.dart';
import 'package:piring_harapan/tukang_masak/view/home_section/ai_menu_recommendation.dart';

class HomeSection extends StatelessWidget {
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
                ProductItemWidget(
                  imagePath: "assets/img/bakwan.png",
                  productName: "Bakwan Sayur",
                  price: 10000,
                ),
                SizedBox(height: 12),
                ProductItemWidget(
                  imagePath: "assets/img/kangkung.png",
                  productName: "Kangkung Tumis",
                  price: 19000,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AiMenuRecommendationPage(
                          menuName: "Kangkung Tumis",
                          ingredients: [
                            {"name": "Bawang Putih", "price": 4000},
                            {"name": "Kangkung", "price": 15000},
                          ],
                          steps: [
                            {
                              "title": "Ingredients Preparation",
                              "content":
                                  "Cuci kangkung dan bawang putih hingga bersih."
                            },
                            {
                              "title": "Cooking",
                              "content":
                                  "Tumis bawang putih hingga harum, lalu masukkan kangkung."
                            },
                            {
                              "title": "Serving",
                              "content":
                                  "Sajikan dalam piring dan siap disantap!"
                            },
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 12),
                ProductItemWidget(
                  imagePath: "assets/img/lontong sayur.png",
                  productName: "Lontong Sayur",
                  price: 25000,
                ),
                SizedBox(height: 8),
                Center(
                  child: MoreButtonWidget(
                    onTap: () {
                      print("More Menu Button Clicked!");
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
