import 'package:flutter/material.dart';

void main() {
  runApp(ElevatedBtnWidget());
}

class ElevatedBtnWidget extends StatefulWidget {
  const ElevatedBtnWidget({super.key});

  @override
  State<ElevatedBtnWidget> createState() => _ElevatedBtnWidgetState();
}

class _ElevatedBtnWidgetState extends State<ElevatedBtnWidget> {
  Color currentColor = Colors.white;

  List<Color> labels = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.white,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentColor,
      body: Column(
        children: labels
            .map(
              (value) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: value, // ✅ 이 방식은 괜찮음
                ),
                onPressed: () {
                  setState(() {
                    currentColor = value;
                  });
                },
                child: Text("click"),
              ),
            )
            .toList(),
      ),
    );
  }
}
