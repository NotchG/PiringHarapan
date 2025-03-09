import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:piring_harapan/pemerintah/view/components/header_navigation.dart';
import 'package:piring_harapan/login_page/component/login_form.dart';
import 'package:piring_harapan/login_page/component/green_button.dart';
import 'package:piring_harapan/login_page/register_page.dart';
import 'package:piring_harapan/pemerintah/view/main_pemerintah_view.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<List<dynamic>> _readUserData() async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      String path = directory.path;
      File file = File('$path/USERS_DATA.json');

      if (await file.exists()) {
        String jsonString = await file.readAsString();
        return jsonString.isNotEmpty ? jsonDecode(jsonString) : [];
      } else {
        print("file USERS_DATA.json tidak ditemukan.");
        return [];
      }
    } catch (e) {
      print("error membaca data: $e");
      return [];
    }
  }

  Future<void> _loginUser() async {
    String inputEmail = emailController.text.trim();
    String inputPassword = passwordController.text.trim();

    if (inputEmail.isEmpty || inputPassword.isEmpty) {
      _showDialog("Error", "Email dan Password tidak boleh kosong.");
      return;
    }

    List<dynamic> users = await _readUserData();

    // Cek apakah email & password cocok
    var matchedUser = users.firstWhere(
      (user) =>
          user["email"] == inputEmail && user["password"] == inputPassword,
      orElse: () => null,
    );

    if (matchedUser != null) {
      String userPosition = matchedUser["position"];
      print(
          "login berhasil: ${matchedUser['fullName']} dengan posisi $userPosition");

      _showDialog(
          "Login Berhasil", "Selamat datang, ${matchedUser['fullName']}!", () {
        _navigateAfterLogin(userPosition);
      });
    } else {
      _showDialog("Login Gagal", "Email atau Password salah.");
    }
  }

  void _navigateAfterLogin(String position) {
    if (position == "Pemerintah") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPemerintahView()),
      );
    } else {
      _showDialog(
          "Info", "User dengan posisi '$position' belum memiliki halaman.");
    }
  } //bagian untuk navigate

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderNavigation(text: "Login Account"),
              SizedBox(height: 20),
              Image.asset(
                "assets/img/logo.png",
                height: 120,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              CustomInputField(
                emailController: emailController,
                passwordController: passwordController,
              ),
              SizedBox(height: 20),
              GreenButton(
                text: "Login",
                onPressed: _loginUser,
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text(
                  "Don't have an account yet? Register Here",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
