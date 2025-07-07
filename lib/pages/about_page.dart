// lib/pages/about_page.dart
import 'package:flutter/material.dart';
import '../app_data.dart';

class AboutPage extends StatefulWidget {
  final AppData data;
  const AboutPage({super.key, required this.data});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Widget _skillBadge(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ScaleTransition(
          scale: Tween(begin: 1.0, end: 1.15).animate(
            CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: color.withOpacity(.15),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: Icon(icon, size: 32, color: color),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Retro‑Farben
    const sapBlue    = Color(0xff1e88e5);
    const consultLil = Color(0xff9c27b0);
    const webCyan    = Color(0xff00bcd4);
    const appGreen   = Color(0xff4caf50);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('About')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff003366), Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Card(
              color: Colors.white.withOpacity(.08),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 600;
                    return isWide
                        ? Row(
                            children: [
                              // Foto links
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/images/Leon_Daumlechner_Foto.jpeg',
                                  width: 180,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 32),
                              // Text + Badges
                              Expanded(child: _aboutContent(
                                  sapBlue, consultLil, webCyan, appGreen)),
                            ],
                          )
                        : Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/images/Leon_Daumlechner_Foto.jpeg',
                                  width: 160,
                                  height: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 24),
                              _aboutContent(
                                  sapBlue, consultLil, webCyan, appGreen),
                            ],
                          );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _aboutContent(Color sapBlue, Color consultLil,
      Color webCyan, Color appGreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Robin Leon Daumlechner',
          style: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 6),
        const Text(
          'Wirtschaftsinformatik • 6. Semester',
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 16),
        const Text(
          'Ich liebe es, Prozesse mit Technologie smarter zu machen. '
          'Aktuell vertiefe ich mich in SAP‑basierte ERP‑Lösungen, '
          'bringe aber auch Erfahrung aus Web‑ & App‑Entwicklung mit.',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          children: [
            _skillBadge(Icons.business_center, 'SAP / ERP', sapBlue),
            _skillBadge(Icons.groups,           'Consulting', consultLil),
            _skillBadge(Icons.web,              'Web‑Dev',    webCyan),
            _skillBadge(Icons.phone_android,    'App‑Dev',    appGreen),
          ],
        ),
      ],
    );
  }
}
