import 'package:flutter/material.dart';

void main() {
  return runApp(CalTextFieldWidget());
}

class CalTextFieldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalTextFieldState();
}

class CalTextFieldState extends State<CalTextFieldWidget> {
  var controller = TextEditingController();

  void changeText(String value) {
    String currentText = controller.text;

    setState(() {
      if (value == "del") {
        // 마지막 문자 삭제
        if (currentText.isNotEmpty) {
          currentText = currentText.substring(0, currentText.length - 1);
        }
      } else if (value == "=") {
        // 계산 수행
        try {
          // 연산자 찾기
          final match = RegExp(r'(\d+)([+\-*/])(\d+)$').firstMatch(currentText);
          if (match != null) {
            final num1 = int.parse(match.group(1)!);
            final op = match.group(2)!;
            final num2 = int.parse(match.group(3)!);

            num result = 0;
            switch (op) {
              case '+':
                result = num1 + num2;
                break;
              case '-':
                result = num1 - num2;
                break;
              case '*':
                result = num1 * num2;
                break;
              case '/':
                result = num2 != 0 ? num1 / num2 : 0;
                break;
            }
            currentText = result.toString();
          }
        } catch (e) {
          currentText = "오류";
        }
      } else if (RegExp(r'[+\-*/]').hasMatch(value)) {
        // 연산자 입력 시, 이미 연산자가 있으면 무시
        if (!RegExp(r'[+\-*/]').hasMatch(currentText)) {
          currentText += value;
        }
      } else {
        // 숫자 입력
        currentText += value;
      }

      controller.text = currentText;
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
    });
  }

  TableRow _buildButtonRow(List<String> labels) {
    return TableRow(
      children: labels.map((label) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: ElevatedButton(
            onPressed: () {
              changeText(label);
            },
            // onPressed: () => onPressed(label),
            child: Text(label, style: const TextStyle(fontSize: 20)),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("계산기")),
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
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                _buildButtonRow(["7", "8", "9", "/"]),
                _buildButtonRow(["4", "5", "6", "*"]),
                _buildButtonRow(["1", "2", "3", "-"]),
                _buildButtonRow(["0", "+", "=", "del"]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
