import 'package:flutter/material.dart';

void main() {
  return runApp(SwtichWidget());
}

class SwtichWidget extends StatefulWidget {
  @override
  State<SwtichWidget> createState() => SwtichWidgetState();
}

class SwtichWidgetState extends State<SwtichWidget> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Switch(
          value: isOn,
          activeColor: Colors.amber,
          onChanged: (value) {
            setState(() {
              isOn = value;
            });
          },
        ),
      ),
    );
  }
}
