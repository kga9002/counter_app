import 'package:flutter/material.dart';

void main() {
  return runApp(RadioWidget());
}

class RadioWidget extends StatefulWidget {
  @override
  State<RadioWidget> createState() => RadioWidgetState();
}

class RadioWidgetState extends State<RadioWidget> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: selected,
                    activeColor: Colors.lightBlue,
                    onChanged: (int? value) {
                      setState(() {
                        selected = value!;
                      });
                    },
                  ),
                  Text("첫번째 라디오 버튼"),
                ],
              ),

              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: selected,
                    activeColor: Colors.lightBlue,
                    onChanged: (int? value) {
                      setState(() {
                        selected = value!;
                      });
                    },
                  ),
                  Text("두번째 라디오 버튼"),
                ],
              ),
            ],
          ),
          // Text(isChecked ? "hihi" : ""),
        ],
      ),
    );
  }
}
