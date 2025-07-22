import 'package:flutter/material.dart';

void main() {
  return runApp(CheckBoxWidget());
}

class CheckBoxWidget extends StatefulWidget {
  @override
  State<CheckBoxWidget> createState() => CheckBoxWidgetState();
}

class CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Checkbox(
              value: isChecked,
              tristate: true,
              activeColor: Colors.lightBlue,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
          ),
          // Text(isChecked ? "hihi" : ""),
        ],
      ),
    );
  }
}
