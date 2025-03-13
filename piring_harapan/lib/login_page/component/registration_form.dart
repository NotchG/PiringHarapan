import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  final Function(bool) onValidationChanged;
  const RegistrationForm({Key? key, required this.onValidationChanged})
      : super(key: key);

  @override
  RegistrationFormState createState() => RegistrationFormState();
}

class RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    _addListeners();
  }

  void _addListeners() {
    fullNameController.addListener(_validateForm);
    positionController.addListener(_validateForm);
    mobileNumberController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      bool isNotEmpty = fullNameController.text.isNotEmpty &&
          positionController.text.isNotEmpty &&
          mobileNumberController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;

      bool isEmailValid =
          RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text);
      bool isPasswordMatch =
          passwordController.text == confirmPasswordController.text;

      isFormValid = isNotEmpty && isEmailValid && isPasswordMatch;
    });

    widget.onValidationChanged(isFormValid);
  }

  Map<String, dynamic> getFormData() {
    return {
      "fullName": fullNameController.text,
      "position": positionController.text,
      "mobileNumber": mobileNumberController.text,
      "email": emailController.text,
      "password": passwordController.text,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildTextField(fullNameController, "Enter your full name",
              isFirst: true),
          _buildTextField(positionController, "Enter your position"),
          _buildTextField(mobileNumberController, "Enter your mobile number"),
          _buildTextField(emailController, "Enter your email", isEmail: true),
          _buildTextField(passwordController, "Enter your password",
              isPassword: true),
          _buildTextField(confirmPasswordController, "Confirm your password",
              isPassword: true, isLast: true),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hintText, {
    bool isPassword = false,
    bool isEmail = false,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: isLast ? BorderSide.none : BorderSide(color: Colors.green),
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: isFirst ? Radius.circular(12) : Radius.zero,
              topRight: isFirst ? Radius.circular(12) : Radius.zero,
              bottomLeft: isLast ? Radius.circular(12) : Radius.zero,
              bottomRight: isLast ? Radius.circular(12) : Radius.zero,
            ),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
