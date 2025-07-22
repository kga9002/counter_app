import 'package:flutter/material.dart';

void main() {
  return runApp(ButtonInputTextFieldWidget());
}

class ButtonInputTextFieldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ButtonInputTextFieldState();
}

class ButtonInputTextFieldState extends State<ButtonInputTextFieldWidget> {
  late String _text = "";
  var controller = TextEditingController();

  void changeText(String value) {
    setState(() {
      if (_text.isNotEmpty) {
        _text = _text.substring(0, _text.length - 1);
      }
      _text += value;
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
              controller: controller,
              decoration: InputDecoration(
                labelText: '숫자입력기',
                border: OutlineInputBorder(),
              ),
            ),
            Text(_text),
            Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        changeText("1");
                      },
                      child: Text(("1")),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        changeText("2");
                      },
                      child: Text(("2")),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        changeText("3");
                      },
                      child: Text(("3")),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        changeText("");
                      },
                      child: Text(("del")),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
