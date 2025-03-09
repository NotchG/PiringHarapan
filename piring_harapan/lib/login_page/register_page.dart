import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:piring_harapan/pemerintah/view/components/header_navigation.dart';
import 'package:piring_harapan/login_page/component/registration_form.dart';
import 'package:piring_harapan/login_page/component/green_button.dart';
import 'package:piring_harapan/login_page/login_page.dart';
import 'package:piring_harapan/pemerintah/view/main_pemerintah_view.dart';

class RegisterPage extends StatefulWidget {
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

  Future<File> _getUserDataFile() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path;
    File file = File('$path/USERS_DATA.json');

    if (!await file.exists()) {
      print("file USERS_DATA.json belum ada, menyalin dari assets...");
      String jsonString =
          await rootBundle.loadString('assets/data/USERS_DATA.json');
      await file.writeAsString(jsonString);
    }
    return file;
  }

  Future<void> _registerUser() async {
    final formData = _formKey.currentState?.getFormData();
    if (formData != null) {
      try {
        File file = await _getUserDataFile();

        String jsonString = await file.readAsString();
        List<dynamic> userData =
            jsonString.isNotEmpty ? jsonDecode(jsonString) : [];

        bool emailExists =
            userData.any((user) => user["email"] == formData["email"]);
        if (emailExists) {
          _showDialog(
              "Registrasi Gagal", "Email sudah digunakan. Gunakan email lain.");
          return;
        }

        userData.add(formData);

        String updatedJson = jsonEncode(userData);
        await file.writeAsString(updatedJson);

        print("data berhasil disimpan: $updatedJson");

        _showDialog("Registrasi Berhasil", "Akun Anda telah berhasil dibuat!",
            () {
          _navigateAfterRegister(formData["position"]);
        });
      } catch (e) {
        print("terjadi error saat menyimpan data: $e");
      }
    }
  }

  void _navigateAfterRegister(String position) {
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderNavigation(text: "Register Account"),
                Image.asset(
                  "assets/img/logo.png",
                  height: 120,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),
                RegistrationForm(
                    key: _formKey, onValidationChanged: _updateFormValidity),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        value: isChecked,
                        onChanged: isFormValid
                            ? (value) {
                                setState(() {
                                  isChecked = value ?? false;
                                });
                              }
                            : null,
                        activeColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "I Agree with the Terms and Conditions",
                        style: TextStyle(fontSize: 14),
                      ),
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
                      MaterialPageRoute(builder: (context) => LoginPage()),
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
