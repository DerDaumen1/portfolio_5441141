import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final String name;
  final String email;
  final String about;
  final double sliderValue;
  final bool newsletter;
  final bool updates;
  final bool darkMode;
  final bool offlineMode;

  const SummaryPage({
    super.key,
    required this.name,
    required this.email,
    required this.about,
    required this.sliderValue,
    required this.newsletter,
    required this.updates,
    required this.darkMode,
    required this.offlineMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zusammenfassung')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("👤 Profil", style: Theme.of(context).textTheme.headlineSmall),
              Text("Name: $name"),
              Text("E‑Mail: $email"),
              Text("Über mich: $about"),
              const SizedBox(height: 20),
              Text("🎚️ Slider‑Wert: ${sliderValue.toInt()}"),
              const SizedBox(height: 20),
              Text("⚙️ Einstellungen", style: Theme.of(context).textTheme.headlineSmall),
              Text("Newsletter: ${newsletter ? "Ja" : "Nein"}"),
              Text("Updates: ${updates ? "Ja" : "Nein"}"),
              Text("Dark Mode: ${darkMode ? "Ein" : "Aus"}"),
              Text("Offline Mode: ${offlineMode ? "Ein" : "Aus"}"),
            ],
          ),
        ),
      ),
    );
  }
}
