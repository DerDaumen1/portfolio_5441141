import 'package:flutter/material.dart';
import '../app_data.dart';
import 'summary_page.dart';

class SettingsPage extends StatefulWidget {
  final AppData data;
  final void Function(bool) onThemeChange;

  const SettingsPage({
    super.key,
    required this.data,
    required this.onThemeChange,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool newsletter;
  late bool updates;
  late bool darkMode;
  late bool offline;

  @override
  void initState() {
    super.initState();
    newsletter = widget.data.newsletter;
    updates    = widget.data.updates;
    darkMode   = widget.data.darkMode;
    offline    = widget.data.offline;
  }

  void _updateState() {
    widget.data
      ..newsletter = newsletter
      ..updates    = updates
      ..darkMode   = darkMode
      ..offline    = offline;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Einstellungen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text('Newsletter abonnieren'),
              value: newsletter,
              onChanged: (v) => setState(() => newsletter = v ?? false),
            ),
            CheckboxListTile(
              title: const Text('Produkt‑Updates erhalten'),
              value: updates,
              onChanged: (v) => setState(() => updates = v ?? false),
            ),
            SwitchListTile(
              title: const Text('Dunkler Modus'),
              value: darkMode,
              onChanged: (v) {
                setState(() => darkMode = v);
                widget.onThemeChange(v);
              },
            ),
            SwitchListTile(
              title: const Text('Offline‑Modus'),
              value: offline,
              onChanged: (v) => setState(() => offline = v),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Zur Zusammenfassung'),
              onPressed: () {
                _updateState();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SummaryPage(data: widget.data)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
