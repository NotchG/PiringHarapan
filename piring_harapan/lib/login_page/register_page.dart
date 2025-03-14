import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/login_page/component/registration_form.dart';
import 'package:piring_harapan/login_page/component/green_button.dart';
import 'package:piring_harapan/login_page/login_page.dart';

class RegisterPage extends StatefulWidget {
  final String selectedRole;

  RegisterPage({required this.selectedRole});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = false;
  bool isFormValid = false;
  final GlobalKey<RegistrationFormState> _formKey =
      GlobalKey<RegistrationFormState>();

  void _updateFormValidity(bool isValid) {
    setState(() {
      isFormValid = isValid;
      if (!isValid) {
        isChecked = false;
      }
    });
  }

  Future<void> _registerUser() async {
    _showDialog("Registrasi Berhasil", "Akun Anda telah berhasil dibuat!", () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(selectedRole: widget.selectedRole)),
      );
    });
  }

  void _showDialog(String title, String message, [VoidCallback? onConfirm]) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                if (onConfirm != null) {
                  onConfirm();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderNavigation(text: "Register Account"),
                SizedBox(height: 8),
                Image.asset(
                  "assets/img/logo.png",
                  height: 145,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),
                RegistrationForm(
                    key: _formKey, onValidationChanged: _updateFormValidity),
                SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text("I Agree with the Terms and Condition"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GreenButton(
                  text: "Register",
                  onPressed: isChecked ? _registerUser : null,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginPage(selectedRole: widget.selectedRole)),
                    );
                  },
                  child: Text(
                    "Already have an account? Login here",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
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
