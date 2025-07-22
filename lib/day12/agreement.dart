import 'package:counter_app/day12/quiz.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(AgreementWidget(data: {}));
}

class AgreementWidget extends StatefulWidget {
  final Map data;

  AgreementWidget({required this.data});

  @override
  State<AgreementWidget> createState() => AgreementWidgetState();
}

class AgreementWidgetState extends State<AgreementWidget> {
  bool hotelagreement = false;

  Future<void> showResultDiaglog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${widget.data["name"]}님의 예약 결과'),
          content: Text('''
          내용 :
          묵으실 일시 : ${widget.data["date"]}
          호텔방 옵션 : ${widget.data["room"]}
          아침식사 여부 : ${widget.data["breakfast"] == 1 ? "있음" : "없음"}
          '''),
          actions: <Widget>[
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotelWidget()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("이 호텔에 묵는것을 동의합니다."),
                Checkbox(
                  value: hotelagreement,
                  onChanged: (bool? value) async {
                    setState(() {
                      hotelagreement = value!;
                    });
                  },
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
                  onPressed: () async {
                    if (hotelagreement) {
                      await showResultDiaglog(context);
                    }
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
