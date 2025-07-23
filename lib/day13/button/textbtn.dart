import 'package:flutter/material.dart';

void main() => runApp(const TextBtnWidget());

class TextBtnWidget extends StatefulWidget {
  const TextBtnWidget({super.key});

  @override
  State<TextBtnWidget> createState() => _TextBtnWidgetState();
}

class _TextBtnWidgetState extends State<TextBtnWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ElevatedButton(onPressed: () {}, child: Text("첫번째페이지로 이동"))],
    );
  }
}
