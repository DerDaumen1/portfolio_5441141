import 'package:flutter/material.dart';
import '../app_data.dart';

class SummaryPage extends StatelessWidget {
  final AppData data;
  const SummaryPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.titleLarge!.copyWith(
      color: Colors.lightBlueAccent,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Everything at a Glance')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // ‑‑ Profil‑Karte ‑‑
            _retroCard(
              context,
              title: '👤  About Me',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name:  ${data.name}', style: headline),
                  const SizedBox(height: 4),
                  Text('E‑Mail: ${data.email}'),
                  const SizedBox(height: 4),
                  Text('Über mich:\n${data.about}'),
                ],
              ),
            ),

            // ‑‑ Slider‑Karte ‑‑
            _retroCard(
              context,
              title: '🎚️  Mood Slider',
              child: Column(
                children: [
                  Text('${data.slider.toInt()} / 100',
                      style: headline.copyWith(fontSize: 32)),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: data.slider / 100,
                    color: Colors.lightBlueAccent,
                    backgroundColor: Colors.grey.shade800,
                    minHeight: 8,
                  ),
                ],
              ),
            ),

            // ‑‑ Settings‑Karte ‑‑
            _retroCard(
              context,
              title: '⚙️  Settings',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Newsletter: ${data.newsletter ? "✔️ Yes" : "❌ No"}'),
                  Text('Updates:   ${data.updates    ? "✔️ Yes" : "❌ No"}'),
                  Text('Dark Mode: ${data.darkMode   ? "🌙 On" : "☀️ Off"}'),
                  Text('Offline:   ${data.offlineMode? "📴 On" : "📶 Off"}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ‑‑ Retro‑Card Helfer ‑‑
  Widget _retroCard(BuildContext ctx,
      {required String title, required Widget child}) {
    return Card(
      color: Colors.grey.shade900,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.lightBlueAccent.shade100, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Theme.of(ctx)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.lightBlueAccent)),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
