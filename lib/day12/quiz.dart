import 'package:flutter/material.dart';
import 'roomType.dart';

// 호텔에 묵을 날짜 시간 설정
// 묵을 호텔방을 드롭다운 선택(스위트룸,오션뷰,시티뷰)
// 호텔에 묵을 사용자 이름
// 아침식사 체크박스
// 전부 선택한 후 이 호텔에 묵는것을 동의합니다 라는 내용의 체크박스
// 이 체크박스를 선택한 후에 맨 밑에 있는 elevatedbutton을 클릭하면
// 예약정보를 반환하는 alertdiaglog 발생

void main() {
  runApp(HotelWidget());
}

class HotelWidget extends StatefulWidget {
  @override
  State<HotelWidget> createState() => HotelState();
}

class HotelState extends State<HotelWidget> {
  DateTime? selectedDate = DateTime.now();

  void selectDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
      cancelText: "취소",
    );

    if (date != null) {
      // 시간 선택
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        // 날짜 + 시간 조합
        final DateTime dateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );

        setState(() {
          selectedDate = dateTime;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text("호텔 예약 화면"),
            // 날짜시간
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(selectedDate.toString()),
                OutlinedButton(onPressed: selectDate, child: Text("날짜 선택")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RoomTypeWidget(data: {"date": selectedDate}),
                      ),
                    );
                  },
                  child: Icon(Icons.keyboard_double_arrow_right),
                ),
              ],
            ),
            // 방 타입 목록
          ],
        ),
      ),
    );
  }
}
