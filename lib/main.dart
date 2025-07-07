import 'package:flutter/material.dart';
import 'app_data.dart';

import 'pages/home_page.dart';   // Startseite mit Foto
import 'pages/home_menu.dart';   // Menü erreichst du über den Button

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appData = AppData();           // zentrale Dateninstanz
  ThemeMode _mode = ThemeMode.light;   // hell / dunkel

  void _toggleTheme(bool isDark) {     // Callback aus SettingsPage
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
      // ► App startet jetzt mit HomePage (Foto + Button)
      home: HomePage(
        appData: appData,
        onThemeChange: _toggleTheme,
      ),
    );
  }
}
