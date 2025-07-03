// lib/pages/contact_page.dart
import 'package:flutter/material.dart';
import '../app_data.dart';

class ContactPage extends StatefulWidget {
  final AppData data;
  const ContactPage({super.key, required this.data});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl    = TextEditingController();
  final _emailCtrl   = TextEditingController();
  final _messageCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Hier könntest Du widget.data.* speichern, falls gewünscht
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Danke, ${_nameCtrl.text}! Deine Nachricht wurde gesendet.',
          ),
        ),
      );
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kontakt')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Bitte deinen Namen eingeben' : null,
              ),
              const SizedBox(height: 12),

              // E‑Mail
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(
                  labelText: 'E‑Mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Bitte deine E‑Mail eingeben';
                  if (!v.contains('@')) return 'Bitte gültige E‑Mail';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Nachricht
              TextFormField(
                controller: _messageCtrl,
                decoration: const InputDecoration(
                  labelText: 'Nachricht',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Bitte eine Nachricht eingeben' : null,
              ),
              const SizedBox(height: 20),

              // Senden‑Button
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Absenden'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
