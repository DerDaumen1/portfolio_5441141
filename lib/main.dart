import 'package:flutter/material.dart';
import 'app_data.dart';

import 'pages/home_menu.dart';   //  ← Retro‑Startseite
//  'pages/home_page.dart' brauchst du jetzt nicht mehr als Startseite.
//  Du kannst die Datei behalten (falls du sie später noch zeigen willst),
//  aber sie wird nicht mehr automatisch gestartet.

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appData = AppData();           // zentrale Dateninstanz
  ThemeMode _mode = ThemeMode.light;   // hell / dunkel

  void _toggleTheme(bool isDark) {
    setState(() {
      _mode = isDark ? ThemeMode.dark : ThemeMode.light;
      appData.darkMode = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _mode,

      // ► App startet mit der Retro‑Homepage
      home: HomeMenu(
        appData: appData,
        onThemeChange: _toggleTheme,
      ),
    );
  }
}
