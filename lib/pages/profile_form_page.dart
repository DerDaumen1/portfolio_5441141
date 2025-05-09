import 'package:flutter/material.dart';

class ProfileFormPage extends StatefulWidget {
  final String initialName;
  final String initialEmail;
  final String initialAbout;
  final void Function(String name, String email, String about) onSave;

  const ProfileFormPage({
    super.key,
    required this.initialName,
    required this.initialEmail,
    required this.initialAbout,
    required this.onSave,
  });

  @override
  State<ProfileFormPage> createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends State<ProfileFormPage> {
  late final nameCtrl = TextEditingController(text: widget.initialName);
  late final emailCtrl = TextEditingController(text: widget.initialEmail);
  late final aboutCtrl = TextEditingController(text: widget.initialAbout);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil bearbeiten')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => v!.isEmpty ? 'Bitte Name eingeben' : null,
              ),
              TextFormField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: 'E‑Mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (v) =>
                    v!.contains('@') ? null : 'Bitte gültige E‑Mail',
              ),
              TextFormField(
                controller: aboutCtrl,
                decoration: const InputDecoration(labelText: 'Über mich'),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Speichern'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onSave(
                      nameCtrl.text,
                      emailCtrl.text,
                      aboutCtrl.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Gespeichert')),
                    );
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
