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
  final _formKey     = GlobalKey<FormState>();
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
    const accentBlue = Color(0xff1e88e5);

    final inputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: accentBlue),
      borderRadius: BorderRadius.circular(12),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('Kontakt')),
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
            constraints: const BoxConstraints(maxWidth: 600),
            child: Card(
              color: Colors.white.withOpacity(.08),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Name
                      TextFormField(
                        controller: _nameCtrl,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: const TextStyle(color: Colors.white70),
                          enabledBorder: inputBorder,
                          focusedBorder: inputBorder,
                        ),
                        validator: (v) => v == null || v.isEmpty
                            ? 'Bitte Namen eingeben'
                            : null,
                      ),
                      const SizedBox(height: 16),

                      // E‑Mail
                      TextFormField(
                        controller: _emailCtrl,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'E‑Mail',
                          labelStyle: const TextStyle(color: Colors.white70),
                          enabledBorder: inputBorder,
                          focusedBorder: inputBorder,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Bitte E‑Mail eingeben';
                          }
                          if (!v.contains('@')) {
                            return 'Bitte gültige E‑Mail';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Nachricht
                      TextFormField(
                        controller: _messageCtrl,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Nachricht',
                          labelStyle: const TextStyle(color: Colors.white70),
                          enabledBorder: inputBorder,
                          focusedBorder: inputBorder,
                        ),
                        maxLines: 4,
                        validator: (v) => v == null || v.isEmpty
                            ? 'Bitte eine Nachricht eingeben'
                            : null,
                      ),
                      const SizedBox(height: 24),

                      // Absenden‑Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.send),
                          label: const Text('Absenden'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: accentBlue,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: _submit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
