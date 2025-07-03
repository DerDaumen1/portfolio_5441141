import 'package:flutter/material.dart';
import '../app_data.dart';
import 'work_page.dart';
import 'about_page.dart';
import 'profile_form_page.dart';
import 'settings_page.dart';
import 'contact_page.dart';
import 'summary_page.dart';

class HomeMenu extends StatelessWidget {
  final AppData appData;
  final void Function(bool) onThemeChange;

  const HomeMenu({
    super.key,
    required this.appData,
    required this.onThemeChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio‑Menü')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Begrüßung
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Text(
                'Willkommen im Portfolio von Leon Daumlechner!',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),

            // ► Home zeigt dieses Menü erneut – optional
            _menuButton(
              context,
              title: 'Home',
              builder: (_) => this,
            ),

            // ► Work & Mood
            _menuButton(
              context,
              title: 'Work & Mood',
              builder: (_) => WorkPage(data: appData),
            ),

            // ► About‑Seite (Anzeige)
            _menuButton(
              context,
              title: 'About Me',
              builder: (_) => AboutPage(data: appData),
            ),

            // ► Profil bearbeiten (Formular)
            _menuButton(
              context,
              title: 'Profil bearbeiten',
              builder: (_) => ProfileFormPage(
                initialName: appData.name,
                initialEmail: appData.email,
                initialAbout: appData.about,
                onSave: (n, e, a) {
                  appData
                    ..name = n
                    ..email = e
                    ..about = a;
                },
              ),
            ),

            // ► Einstellungen
            _menuButton(
              context,
              title: 'Einstellungen',
              builder: (_) => SettingsPage(
                data: appData,
                onThemeChange: onThemeChange,
              ),
            ),

            // ► Kontakt
            _menuButton(
              context,
              title: 'Kontakt',
              builder: (_) => ContactPage(data: appData),
            ),

            const Divider(height: 40),

            // ► Zusammenfassung
            _menuButton(
              context,
              title: 'Zusammenfassung',
              builder: (_) => SummaryPage(data: appData),
            ),
          ],
        ),
      ),
    );
  }

  // Hilfs‑Funktion für Buttons
  Widget _menuButton(
    BuildContext ctx, {
    required String title,
    required WidgetBuilder builder,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () => Navigator.push(ctx, MaterialPageRoute(builder: builder)),
        child: Text(title),
      ),
    );
  }
}
