import 'package:flutter/material.dart';
import '../app_data.dart';
import 'slider_page.dart';
import 'profile_form_page.dart';
import 'settings_page.dart';
import 'summary_page.dart';

class HomeMenu extends StatelessWidget {
  final AppData appData;
  final void Function(bool) onThemeChange;
  const HomeMenu({super.key, required this.appData, required this.onThemeChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio‑Menü')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _menuButton(
              context,
              title: 'Slider‑Seite',
              builder: (_) => SliderPage(
                value: appData.slider,
                onChanged: (v) => appData.slider = v,
              ),
            ),
            _menuButton(
              context,
              title: 'Profil‑Formular',
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
            _menuButton(
              context,
              title: 'Einstellungen',
              builder: (_) => SettingsPage(
                data: appData,
                onThemeChange: onThemeChange,
              ),
            ),
            const Divider(height: 40),
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

  Widget _menuButton(BuildContext ctx,
      {required String title, required WidgetBuilder builder}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () => Navigator.push(ctx, MaterialPageRoute(builder: builder)),
        child: Text(title),
      ),
    );
  }
}
