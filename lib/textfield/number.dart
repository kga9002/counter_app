import 'package:flutter/material.dart';

void main() {
  return runApp(NumberTextFieldWidget());
}

class NumberTextFieldWidget extends StatefulWidget {
  @override
  State<NumberTextFieldWidget> createState() => NumberTextFieldState();
}

class NumberTextFieldState extends State<NumberTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "나이 입력",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
