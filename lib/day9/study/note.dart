import 'package:flutter/material.dart';

void main() {
  return runApp(NoteTextFieldWidget());
}

class NoteTextFieldWidget extends StatefulWidget {
  @override
  State<NoteTextFieldWidget> createState() => NoteTextFieldState();
}

class NoteTextFieldState extends State<NoteTextFieldWidget> {
  final _focusNode = FocusScopeNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _focusNode.unfocus(),
      child: FocusScope(
        node: _focusNode,
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "이름 입력",
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "직업 입력",
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 20,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "이메일 입력",
                    border: OutlineInputBorder(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextField(
                    maxLines: 7,
                    maxLength: 500,
                    decoration: InputDecoration(
                      labelText: "자기소개서 내용 입력",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
