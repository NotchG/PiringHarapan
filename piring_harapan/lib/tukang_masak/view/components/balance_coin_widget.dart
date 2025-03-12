import 'package:flutter/material.dart';

class BalanceCoinWidget extends StatelessWidget {
  final int balance;
  final int coin;

  const BalanceCoinWidget({
    Key? key,
    required this.balance,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBalanceOrCoin(
            icon: Icons.account_balance_wallet,
            label: "Balance",
            value: "Rp${balance.toString().replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (Match m) => "${m[1]}.",
                )}",
          ),
          Container(
            height: 40,
            width: 1.5,
            color: Colors.grey[400],
          ),
          _buildBalanceOrCoin(
            icon: Icons.monetization_on,
            label: "Coin",
            value: coin.toString().replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (Match m) => "${m[1]}.",
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceOrCoin({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 24),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
