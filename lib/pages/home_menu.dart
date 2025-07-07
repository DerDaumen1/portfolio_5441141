import 'package:flutter/material.dart';
import '../app_data.dart';
import 'work_page.dart';
import 'about_page.dart';
import 'contact_page.dart';

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
    final blueAccent = Colors.lightBlueAccent;

    return Scaffold(
      backgroundColor: Colors.black,  // Retro‑Dark
      appBar: AppBar(
        title: const Text('Leon Daumlechner • Portfolio'),
        actions: [
          IconButton(
            icon: Icon(
              appData.darkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: 'Theme wechseln',
            onPressed: () => onThemeChange(!appData.darkMode),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) => SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ── Portrait ────────────────────────────────────────────────
                  CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        const AssetImage('assets/images/Leon_Daumlechner_Foto.jpeg'),
                    backgroundColor: blueAccent.withOpacity(.2),
                  ),
                  const SizedBox(height: 24),

                  // ── Name & Facts ───────────────────────────────────────────
                  Text(
                    'Leon Daumlechner',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: blueAccent, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Wirtschaftsinformatik • 6. Semester\n'
                    'Trikot‑/Matrikelnummer: 5441141\n'
                    'Telefon: 0644 1567 109   •   '
                    'E‑Mail: leon.daumlechner@gmx.de',
                    textAlign: TextAlign.center,
                    style:
                        Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(height: 32),

                  // ── Navigations‑Grid ──────────────────────────────────────
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    alignment: WrapAlignment.center,
                    children: [
                      _navTile(
                        context,
                        icon: Icons.work,
                        label: 'Work',
                        builder: (_) => WorkPage(
                          data: appData,
                          onThemeChange: onThemeChange,
                        ),
                      ),
                      _navTile(
                        context,
                        icon: Icons.person,
                        label: 'About',
                        builder: (_) => AboutPage(data: appData),
                      ),
                      _navTile(
                        context,
                        icon: Icons.mail,
                        label: 'Contact',
                        builder: (_) => ContactPage(data: appData),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ───────────────────────── Helper für Kachel ──────────────────────────
  Widget _navTile(
    BuildContext ctx, {
    required IconData icon,
    required String label,
    required WidgetBuilder builder,
  }) {
    return InkWell(
      onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: builder)),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 200,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.lightBlueAccent, width: 1.4),
          boxShadow: [
            BoxShadow(
              color: Colors.lightBlueAccent.withOpacity(.25),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 46, color: Colors.lightBlueAccent),
            const SizedBox(height: 16),
            Text(
              label,
              style: Theme.of(ctx)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.lightBlueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
