import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Importiere deine neue Seite
import 'package:portfolio_5441141/pages/slider_page.dart';
import 'package:portfolio_5441141/pages/profile_form_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ProfileFormPage(),
 // Nutze die neue Startseite
    );
  }
}
