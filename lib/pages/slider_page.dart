import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  final double value;
  final void Function(double) onChanged;

  const SliderPage({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider‑Seite')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: _value,
            min: 0,
            max: 100,
            label: _value.toInt().toString(),
            onChanged: (v) => setState(() => _value = v),
            onChangeEnd: (v) => widget.onChanged(v),
          ),
          const SizedBox(height: 16),
          Text('Aktueller Wert: ${_value.toInt()}'),
          const SizedBox(height: 16),
          Container(
            width: 60,
            height: 60,
            color: Colors.blue.withOpacity(_value / 100),
          ),
        ],
      ),
    );
  }
}
