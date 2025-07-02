import 'package:flutter/material.dart';
import '../app_data.dart';

class MoodSliderPage extends StatefulWidget {
  final AppData data;
  const MoodSliderPage({super.key, required this.data});

  @override
  State<MoodSliderPage> createState() => _MoodSliderPageState();
}

class _MoodSliderPageState extends State<MoodSliderPage> {
  double mood = 50;

  @override
  void initState() {
    super.initState();
    mood = widget.data.slider;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wie ist dein Gemüt heute?")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Stimmung: ${mood.toInt()}",
                style: Theme.of(context).textTheme.headlineMedium),
            Slider(
              value: mood,
              min: 0,
              max: 100,
              divisions: 100,
              label: mood.toInt().toString(),
              onChanged: (value) {
                setState(() => mood = value);
                widget.data.slider = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
