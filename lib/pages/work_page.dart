import 'package:flutter/material.dart';
import '../app_data.dart';
import 'mood_slider_page.dart';
import 'summary_page.dart';

class WorkPage extends StatelessWidget {
  final AppData data;
  const WorkPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Work & Mood')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.mood),
              label: const Text('Gemüt‑Slider'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MoodSliderPage(data: data),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.description),
              label: const Text('Zusammenfassung'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SummaryPage(data: data),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
