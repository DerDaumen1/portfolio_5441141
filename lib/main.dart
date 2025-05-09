import 'package:flutter/material.dart';
import 'app_data.dart';
import 'pages/home_menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appData = AppData();                // zentrale Dateninstanz
  ThemeMode _mode = ThemeMode.light;

  void toggleTheme(bool isDark) {
    setState(() {
      _mode = isDark ? ThemeMode.dark : ThemeMode.light;
      appData.darkMode = isDark;            // direkt mitschreiben
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _mode,
      home: HomeMenu(
        appData: appData,
        onThemeChange: toggleTheme,
      ),
    );
  }
}
