import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const CustomInputField({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildTextField(emailController, "Enter your email", isFirst: true),
          Divider(color: Colors.green, height: 1),
          _buildTextField(passwordController, "Enter your password",
              isPassword: true, isLast: true),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hintText, {
    bool isPassword = false,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
