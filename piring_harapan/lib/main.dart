import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piring_harapan/pemerintah/view/home_section/pemerintah_home_view.dart';
import 'package:piring_harapan/pemerintah/view/main_pemerintah_view.dart';
import 'package:piring_harapan/tukang_masak/main_tukang_masak_view.dart';
import 'package:piring_harapan/login_page/register_page.dart';
import 'package:piring_harapan/splash_screen.dart';
import 'package:piring_harapan/role_select.dart';
import 'package:piring_harapan/petani/main_petani_view.dart';
import 'package:piring_harapan/penerima/main_penerima_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: _buildTheme(),
    routes: {
      '/': (context) => SplashScreen(),
      '/roleSelection': (context) => RoleSelectionScreen(),
      '/pemerintah': (context) => MainPemerintahView(),
      '/tukang_masak': (context) => MainTukangMasakView(),
      '/petani': (context) => MainPetaniView(),
      '/penerima': (context) => MainPenerimaView(),
    },
  ));
}

ThemeData _buildTheme() {
  var baseTheme = ThemeData();

  return baseTheme.copyWith(
    textTheme: GoogleFonts.soraTextTheme(baseTheme.textTheme),
  );
}
