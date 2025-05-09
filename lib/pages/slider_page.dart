import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider-Seite')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: _value,
            min: 0,
            max: 100,
            divisions: 100,
            label: _value.round().toString(),
            onChanged: (double newValue) {
              setState(() {
                _value = newValue;
              });
            },
          ),
          Text('Aktueller Wert: ${_value.round()}'),
          SizedBox(height: 20),
          Container(
            height: _value, // verändert sich mit dem Wert
            width: 100,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
