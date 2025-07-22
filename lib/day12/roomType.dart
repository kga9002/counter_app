import 'package:flutter/material.dart';

import 'customerName.dart';

void main() {
  return runApp(RoomTypeWidget(data: {}));
}

class RoomTypeWidget extends StatefulWidget {
  final Map data;

  RoomTypeWidget({required this.data});

  @override
  State<RoomTypeWidget> createState() => RoomTypeWidgetState();
}

class RoomTypeWidgetState extends State<RoomTypeWidget> {
  String? roomType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: DropdownButton(
                value: roomType,
                items: [
                  DropdownMenuItem(value: "스위트룸", child: Text("스위트룸")),
                  DropdownMenuItem(value: "오션뷰", child: Text("오션뷰")),
                  DropdownMenuItem(value: "시티뷰", child: Text("시티뷰")),
                ],
                onChanged: (String? value) {
                  setState(() {
                    roomType = value!;
                  });
                },
                hint: Text("방 선택"),
              ),
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
                    if (roomType != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerNameWidget(
                            data: {
                              ...widget.data, // 기존 데이터 복사
                              "room": roomType, // 새로운 키 추가
                            },
                          ),
                        ),
                      );
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
