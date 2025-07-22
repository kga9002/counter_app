import 'package:flutter/material.dart';

import 'agreement.dart';

void main() {
  return runApp(BreakfastWidget(data: {}));
}

class BreakfastWidget extends StatefulWidget {
  final Map data;
  BreakfastWidget({required this.data});
  @override
  State<BreakfastWidget> createState() => BreakfastWidgetState();
}

class BreakfastWidgetState extends State<BreakfastWidget> {
  int breakfast = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("아침식사 여부"),
                Row(
                  children: [
                    Text("있음"),
                    Radio(
                      value: 1,
                      groupValue: breakfast,
                      onChanged: (int? value) {
                        setState(() {
                          breakfast = value!;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("없음"),
                    Radio(
                      value: 2,
                      groupValue: breakfast,
                      onChanged: (int? value) {
                        setState(() {
                          breakfast = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.keyboard_double_arrow_left),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AgreementWidget(
                          data: {...widget.data, "breakfast": breakfast},
                        ),
                      ),
                    );
                  },
                  child: Icon(Icons.keyboard_double_arrow_right),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
