import 'package:flutter/material.dart';

void main() {
  return runApp(QuizWidget());
}

class QuizWidget extends StatefulWidget {
  @override
  State<QuizWidget> createState() => QuizState();
}

class QuizState extends State<QuizWidget> {
  int num1 = 0;
  int num2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "숫자1 입력",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        num1 = int.parse(value);
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "숫자2 입력",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        num2 = int.parse(value);
                      });
                    },
                  ),
                ),
              ],
            ),

            Text("$num1 + $num2 의 결과는 ${num1 + num2} 입니다."),
            Text("$num1 - $num2 의 결과는 ${num1 - num2} 입니다."),
            Text("$num1 X $num2 의 결과는 ${num1 * num2} 입니다."),
            Text("$num1 / $num2 의 결과는 ${num1 / num2} 입니다."),
          ],
        ),
      ),
    );
  }
}
