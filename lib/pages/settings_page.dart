  import 'package:flutter/material.dart';
  import 'package:portfolio_5441141/pages/summary_page.dart';

  class SettingsPage extends StatefulWidget {
    final void Function(bool isDarkMode) onThemeChange;
    const SettingsPage({super.key, required this.onThemeChange});

    @override
    State<SettingsPage> createState() => _SettingsPageState();
  }

  class _SettingsPageState extends State<SettingsPage> {
    bool newsletter = false;
    bool updates = false;
    bool darkMode   = false;
    bool offlineMode = false;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Einstellungen')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Checkboxen
              CheckboxListTile(
                title: const Text("Newsletter abonnieren"),
                value: newsletter,
                onChanged: (value) => setState(() => newsletter = value ?? false),
              ),
              CheckboxListTile(
                title: const Text("Produktupdates erhalten"),
                value: updates,
                onChanged: (value) => setState(() => updates = value ?? false),
              ),

              // Switches
              SwitchListTile(
                title: const Text("Dunkler Modus"),
                value: darkMode,
                onChanged: (value) {
                  setState(() {
                    darkMode = value;
                    widget.onThemeChange(value);          // Theme umschalten
                  });
                },
              ),
              SwitchListTile(
                title: const Text("Offline-Modus"),
                value: offlineMode,
                onChanged: (value) => setState(() => offlineMode = value),
              ),

              const SizedBox(height: 20),
              const Divider(),

              // Zusammenfassung
              Text(
                "Zusammenfassung:\n"
                "- Newsletter: ${newsletter ? "Ja" : "Nein"}\n"
                "- Updates: ${updates ? "Ja" : "Nein"}\n"
                "- Dark Mode: ${darkMode ? "Ein" : "Aus"}\n"
                "- Offline: ${offlineMode ? "Ein" : "Aus"}",
              ),

              const SizedBox(height: 20),

              // Button zur SummaryPage
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SummaryPage(
                        name: 'Max Mustermann',
                        email: 'max@example.com',
                        about: 'Ein Flutter‑Fan!',
                        sliderValue: 42,          // Platzhalter – später ersetzen
                        newsletter: newsletter,
                        updates: updates,
                        darkMode: darkMode,
                        offlineMode: offlineMode,
                      ),
                    ),
                  );
                },
                child: const Text("Zur Zusammenfassung"),
              ),
            ],
          ),
        ),
      );
    }
  }
