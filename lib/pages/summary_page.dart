import 'package:flutter/material.dart';
import '../app_data.dart';

class SummaryPage extends StatelessWidget {
  final AppData data;
  const SummaryPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zusammenfassung')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('👤 Profil', style: Theme.of(context).textTheme.headlineSmall),
              Text('Name: ${data.name}'),
              Text('E‑Mail: ${data.email}'),
              Text('Über mich: ${data.about}'),
              const SizedBox(height: 20),
              Text('🎚️ Slider‑Wert: ${data.slider.toInt()}'),
              const SizedBox(height: 20),
              Text('⚙️ Einstellungen', style: Theme.of(context).textTheme.headlineSmall),
              Text('Newsletter: ${data.newsletter ? "Ja" : "Nein"}'),
              Text('Updates: ${data.updates ? "Ja" : "Nein"}'),
              Text('Dark Mode: ${data.darkMode ? "Ein" : "Aus"}'),
              Text('Offline Mode: ${data.offline ? "Ein" : "Aus"}'),
            ],
          ),
        ),
      ),
    );
  }
}
