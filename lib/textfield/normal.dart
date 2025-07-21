import 'package:flutter/material.dart';

void main() {
  return runApp(NormalTextFieldWidget());
}

class NormalTextFieldWidget extends StatefulWidget {
  @override
  State<NormalTextFieldWidget> createState() => NormalTextFieldState();
}

class NormalTextFieldState extends State<NormalTextFieldWidget> {
  String _text = "";

  void changeText(String value) {
    setState(() {
      _text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "이름을 입력하세요",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                changeText(value);
              },
            ),
            Text(_text),
          ],
        ),
      ),
    );
  }
}
