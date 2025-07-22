import 'package:flutter/material.dart';

void main() {
  return runApp(PassWordTextFieldWidget());
}

class PassWordTextFieldWidget extends StatefulWidget {
  @override
  State<PassWordTextFieldWidget> createState() => PassWordTextFieldState();
}

class PassWordTextFieldState extends State<PassWordTextFieldWidget> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            TextField(
              // obscureText: !_isVisible,
              maxLines: 5,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: _isVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
                labelText: "비밀번호 입력",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
