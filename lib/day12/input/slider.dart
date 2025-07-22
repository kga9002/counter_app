import 'package:flutter/material.dart';

void main() {
  return runApp(SliderWidget());
}

class SliderWidget extends StatefulWidget {
  @override
  State<SliderWidget> createState() => SliderWidgetState();
}

class SliderWidgetState extends State<SliderWidget> {
  double value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Slider(
          value: value,
          min: 0,
          max: 1,
          divisions: 5,
          activeColor: Colors.amber,
          onChanged: (double newValue) {
            setState(() {
              value = newValue;
            });
          },
        ),
      ),
    );
  }
}
