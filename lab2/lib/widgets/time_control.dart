import 'package:flutter/material.dart';

class TimeControl extends StatefulWidget {
  const TimeControl({super.key});

  @override
  State<TimeControl> createState() => _TimeControlState();
}

class _TimeControlState extends State<TimeControl> {
  double _time = 30;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _time,
          divisions: 15,
          max: 150,
          onChanged: (double value) {
            setState(() {
              _time = value;
            });
          },
        ),
        Text('${_time.round()} minuter'),
      ],
    );
  }
}