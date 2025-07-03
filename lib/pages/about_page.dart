import 'package:flutter/material.dart';
import '../app_data.dart';

class AboutPage extends StatelessWidget {
  final AppData data;
  const AboutPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Über mich')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar (Platzhalter‑Retro‑Icon)
            Center(
              child: CircleAvatar(
                radius: 48,
                backgroundColor: Colors.blue.shade700,
                child: const Icon(
                  Icons.person,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),

            Text('Name:',
                style: Theme.of(context).textTheme.titleMedium),
            Text(
              data.name.isEmpty ? '— nicht gesetzt —' : data.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),

            Text('E‑Mail:',
                style: Theme.of(context).textTheme.titleMedium),
            Text(
              data.email.isEmpty ? '— nicht gesetzt —' : data.email,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),

            Text('Über mich:',
                style: Theme.of(context).textTheme.titleMedium),
            Text(
              data.about.isEmpty ? '— nicht gesetzt —' : data.about,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
