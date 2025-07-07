import 'package:flutter/material.dart';
import '../app_data.dart';
import 'home_menu.dart';

class HomePage extends StatelessWidget {
  final AppData appData;
  final void Function(bool) onThemeChange;

  const HomePage({super.key, required this.appData, required this.onThemeChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Schwarz als Hintergrund
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ► Bild von Leon
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/Leon_Daumlechner_Foto.jpeg',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // ► Text
              const Text(
                'Leon Daumlechner',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Wirtschaftsinformatik – 6. Semester',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 30),

              // ► Button zum Menü
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeMenu(
                      appData: appData,
                      onThemeChange: onThemeChange,
                    ),
                  ),
                ),
                child: const Text('Zum Portfolio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//               ),