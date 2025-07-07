// lib/pages/work_page.dart
import 'package:flutter/material.dart';
import '../app_data.dart';
import 'mood_slider_page.dart';
import 'profile_form_page.dart';
import 'summary_page.dart';


class WorkPage extends StatefulWidget {
  final AppData data;
  final void Function(bool) onThemeChange;   // Callback aus main.dart
  const WorkPage({
    super.key,
    required this.data,
    required this.onThemeChange,
  });

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage>
    with SingleTickerProviderStateMixin {
  late double _sliderVal;
  late bool   _newsletter;
  late bool   _offline;

  late final AnimationController _emojiCtrl;

  @override
  void initState() {
    super.initState();
    _sliderVal  = widget.data.slider;
    _newsletter = widget.data.newsletter;
    _offline    = widget.data.offlineMode;

    _emojiCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _emojiCtrl.dispose();
    super.dispose();
  }

  // Stimmungs‑Emoji anhand Sliderwert
  String get _moodEmoji {
    if (_sliderVal >= 67) return '😄';
    if (_sliderVal >= 34) return '😐';
    return '😢';
  }

  // ----- UI  ---------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    const accentBlue = Color(0xff1e88e5);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('Work – Live Demos')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff003366), Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _introCard(),
            const SizedBox(height: 24),
            _sliderDemoCard(accentBlue),
            const SizedBox(height: 24),
            _profileDemoCard(accentBlue),
            const SizedBox(height: 24),
            _settingsDemoCard(accentBlue),
            const SizedBox(height: 32),
            _ctaCard(accentBlue),
          ],
        ),
      ),
    );
  }

  // ----- Cards -------------------------------------------------------------
  Widget _glassCard({required Widget child}) {
    return Card(
      color: Colors.white.withOpacity(.08),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(padding: const EdgeInsets.all(24), child: child),
    );
  }

  Widget _introCard() => _glassCard(
        child: Text(
          'Hier zeige ich interaktive Widgets und State‑Management aus den '
          'ersten beiden Praktikumsblättern (Slider, Formulare, Einstellungen).',
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      );

  // Slider‑Demo
  Widget _sliderDemoCard(Color accent) => _glassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gemüts‑Slider', style: _titleStyle),
            const SizedBox(height: 12),
            Slider(
              value: _sliderVal,
              max: 100,
              divisions: 100,
              activeColor: accent,
              label: _sliderVal.toInt().toString(),
              onChanged: (v) {
                setState(() {
                  _sliderVal = v;
                  widget.data.slider = v;
                });
              },
            ),
            const SizedBox(height: 6),
            Center(
              child: ScaleTransition(
                scale: Tween(begin: 1.0, end: 1.3).animate(
                  CurvedAnimation(parent: _emojiCtrl, curve: Curves.easeInOut),
                ),
                child: Text(
                  _moodEmoji,
                  style: const TextStyle(fontSize: 48),
                ),
              ),
            ),
          ],
        ),
      );

  // Profil‑Formular‑Demo
  Widget _profileDemoCard(Color accent) => _glassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profil‑Formular', style: _titleStyle),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('Profil ausfüllen'),
              style: ElevatedButton.styleFrom(
                backgroundColor: accent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => _openProfileSheet(context),
            ),
          ],
        ),
      );

  Future<void> _openProfileSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black.withOpacity(.85),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ProfileFormPage(
          initialName: widget.data.name,
          initialEmail: widget.data.email,
          initialAbout: widget.data.about,
          onSave: (n, e, a) {
            setState(() {
              widget.data
                ..name = n
                ..email = e
                ..about = a;
            });
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profil gespeichert!')),
            );
          },
        ),
      ),
    );
  }

  // Einstellungen‑Demo
  Widget _settingsDemoCard(Color accent) => _glassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Einstellungen', style: _titleStyle),
            const SizedBox(height: 12),
            CheckboxListTile(
              value: _newsletter,
              title: const Text('Newsletter abonnieren',
                  style: TextStyle(color: Colors.white)),
              activeColor: accent,
              onChanged: (v) {
                setState(() {
                  _newsletter = v ?? false;
                  widget.data.newsletter = _newsletter;
                });
              },
            ),
            SwitchListTile(
              value: _offline,
              title: const Text('Offline‑Modus',
                  style: TextStyle(color: Colors.white)),
              activeColor: accent,
              onChanged: (v) {
                setState(() {
                  _offline = v;
                  widget.data.offlineMode = v;
                });
              },
            ),
          ],
        ),
      );

  // CTA‑Card
  Widget _ctaCard(Color accent) => _glassCard(
        child: Center(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.dashboard_customize),
            label: const Text('Alles im Überblick'),
            style: ElevatedButton.styleFrom(
              backgroundColor: accent,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
              textStyle: const TextStyle(fontSize: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SummaryPage(data: widget.data)),
            ),
          ),
        ),
      );

  TextStyle get _titleStyle => const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
}
