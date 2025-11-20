import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/profile_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;

  void toggleTheme() => setState(() => _isDark = !_isDark);

  @override
  Widget build(BuildContext context) {
    // ================================
    // WARNA UTAMA TEMA
    // ================================
    final crimson = const Color(0xFF8B0000); // Crimson Merah
    final gold = const Color(0xFFB8860B); // Old Gold

    final background = _isDark
        ? const Color(0xFF0E0E0E) // background gelap
        : const Color(0xFFF7F7F7); // background terang

    // ================================
    // THEME DATA GLOBAL (FINAL)
    // ================================
    final theme = ThemeData(
      useMaterial3: true,
      brightness: _isDark ? Brightness.dark : Brightness.light,

      // ------------ COLOR SCHEME ------------
      colorScheme: ColorScheme(
        brightness: _isDark ? Brightness.dark : Brightness.light,

        // Warna utama aplikasi
        primary: _isDark ? gold : crimson,
        onPrimary: Colors.white,

        // Warna sekunder (aksen)
        secondary: gold,
        onSecondary: Colors.black,

        // Warna background
        background: background,
        onBackground: _isDark ? gold : Colors.black,

        // Warna permukaan (card)
        surface: _isDark ? const Color(0xFF1A1A1A) : Colors.white,
        onSurface: _isDark ? gold : Colors.black,

        // Error
        error: Colors.red,
        onError: Colors.white,
      ),

      scaffoldBackgroundColor: background,

      // ------------ TEXT THEME ------------
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: _isDark ? gold : Colors.black,
        displayColor: _isDark ? gold : Colors.black,
      ),

      // ------------ APPBAR THEME ------------
      appBarTheme: AppBarTheme(
        backgroundColor: _isDark ? gold : crimson,
        foregroundColor: Colors.white,
        elevation: 4,
      ),

      // ------------ ICON & LIST TILE ------------
      listTileTheme: ListTileThemeData(
        iconColor: _isDark ? gold : crimson,
        textColor: _isDark ? gold : Colors.black,
      ),
    );

    return MaterialApp(
      title: 'Profil Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: ProfilePage(onToggleTheme: toggleTheme, isDark: _isDark),
    );
  }
}
