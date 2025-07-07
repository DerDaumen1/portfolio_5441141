// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import '../app_data.dart';
import 'work_page.dart';
import 'about_page.dart';
import 'contact_page.dart';

class HomePage extends StatelessWidget {
  final AppData appData;
  final void Function(bool) onThemeChange;   // falls du Dark‑Mode‑Toggle brauchst

  const HomePage({
    super.key,
    required this.appData,
    required this.onThemeChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // (Optional) Dark‑Mode‑Switch in der AppBar
      appBar: AppBar(
        title: const Text('Leon Daumlechner'),
        actions: [
          Switch(
            value: appData.darkMode,
            onChanged: onThemeChange,
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Foto
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset(
                  'assets/images/Leon_Daumlechner_Foto.jpeg',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Name + Infos
              Text(
                'Leon Daumlechner',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 4),
              const Text('Wirtschaftsinformatik, 6. Semester'),
              const SizedBox(height: 4),
              const Text('Tel.: 0644 1567 109'),
              const Text('E‑Mail: leon.daumlechner@gmx.de'),
              const SizedBox(height: 24),

              // Buttons zu den Unterseiten
              _navButton(
  context,
  icon: Icons.work,
  label: 'Work',
  builder: (_) => WorkPage(
    data: appData,
    onThemeChange: onThemeChange,   // << Callback mitgeben
  ),
),
              _navButton(
                context,
                icon: Icons.person,
                label: 'About',
                builder: (_) => AboutPage(data: appData),
              ),
              _navButton(
                context,
                icon: Icons.mail,
                label: 'Contact',
                builder: (_) => ContactPage(data: appData),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(BuildContext ctx,
      {required IconData icon,
      required String label,
      required WidgetBuilder builder}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(180, 40),
        ),
        onPressed: () => Navigator.push(ctx, MaterialPageRoute(builder: builder)),
      ),
    );
  }
}
