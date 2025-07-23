import 'package:flutter/material.dart';

void main() => runApp(const SingleChildWidget());

class SingleChildWidget extends StatelessWidget {
  const SingleChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("single child 연습")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
          ],
        ),
      ),
    );
  }
}
