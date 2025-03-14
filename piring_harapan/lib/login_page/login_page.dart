import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';
import 'package:piring_harapan/login_page/component/login_form.dart';
import 'package:piring_harapan/login_page/component/green_button.dart';
import 'package:piring_harapan/login_page/register_page.dart';
import 'package:piring_harapan/penerima/main_penerima_view.dart';
import 'package:piring_harapan/pemerintah/view/main_pemerintah_view.dart';
import 'package:piring_harapan/tukang_masak/main_tukang_masak_view.dart';
import 'package:piring_harapan/petani/main_petani_view.dart';

class LoginPage extends StatefulWidget {
  final String selectedRole;

  LoginPage({required this.selectedRole});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Future<List<dynamic>> _readUserData() async {
  //   try {
  //     Directory directory = await getApplicationDocumentsDirectory();
  //     String path = directory.path;
  //     File file = File('$path/USERS_DATA.json');
  //
  //     if (await file.exists()) {
  //       String jsonString = await file.readAsString();
  //       return jsonString.isNotEmpty ? jsonDecode(jsonString) : [];
  //     } else {
  //       print("File USERS_DATA.json tidak ditemukan.");
  //       return [];
  //     }
  //   } catch (e) {
  //     print("Error membaca data: $e");
  //     return [];
  //   }
  // }

  Future<List<dynamic>> _readUserData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/data/USERS_DATA.json');
      return jsonString.isNotEmpty ? jsonDecode(jsonString) : [];
    } catch (e) {
      print("Error membaca data: $e");
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

    var matchedUser = users.firstWhere(
      (user) =>
          user["email"] == inputEmail && user["password"] == inputPassword,
      orElse: () => null,
    );

    if (matchedUser != null) {
      print("Login berhasil: ${matchedUser['fullName']}");

      _showDialog(
          "Login Berhasil", "Selamat datang, ${matchedUser['fullName']}!", () {
        _navigateAfterLogin();
      });
    } else {
      _showDialog("Login Gagal", "Email atau Password salah.");
    }
  }

  void _navigateAfterLogin() {
    switch (widget.selectedRole) {
      case "Penerima":
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPenerimaView()),
        );
        break;
      case "Pemerintah":
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPemerintahView()),
        );
        break;
      case "Pemasak":
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainTukangMasakView()),
        );
        break;
      case "Petani":
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPetaniView()),
        );
        break;
    }
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderNavigation(text: "Login Account"),
              SizedBox(height: 20),
              Image.asset(
                "assets/img/logo.png",
                height: 145,
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
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RegisterPage(selectedRole: widget.selectedRole)),
                  );
                },
                child: Text(
                  "Don't have an account yet? Register here",
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
    );
  }
}
