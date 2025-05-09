import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final void Function(bool isDarkMode) onThemeChange;
  const SettingsPage({super.key, required this.onThemeChange});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool newsletter = false;
  bool updates = false;
  bool darkMode = false;
  bool offlineMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Einstellungen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text("Newsletter abonnieren"),
              value: newsletter,
              onChanged: (value) {
                setState(() => newsletter = value ?? false);
              },
            ),
            CheckboxListTile(
              title: const Text("Produktupdates erhalten"),
              value: updates,
              onChanged: (value) {
                setState(() => updates = value ?? false);
              },
            ),
            SwitchListTile(
              title: const Text("Dunkler Modus"),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                  widget.onThemeChange(value); // 🔄 Thema wechseln
                });
              },
            ),
            SwitchListTile(
              title: const Text("Offline-Modus"),
              value: offlineMode,
              onChanged: (value) {
                setState(() => offlineMode = value);
              },
            ),
            const SizedBox(height: 20),
            const Divider(),
            Text(
              "Zusammenfassung:\n"
              "- Newsletter: ${newsletter ? "Ja" : "Nein"}\n"
              "- Updates: ${updates ? "Ja" : "Nein"}\n"
              "- Dark Mode: ${darkMode ? "Ein" : "Aus"}\n"
              "- Offline: ${offlineMode ? "Ein" : "Aus"}",
            ),
          ],
        ),
      ),
    );
  }
}
