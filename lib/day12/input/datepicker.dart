import 'package:flutter/material.dart';

void main() {
  return runApp(DatePickerWidget());
}

class DatePickerWidget extends StatefulWidget {
  @override
  State<DatePickerWidget> createState() => DatePickerWidgetState();
}

class DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
      cancelText: "취소",
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(selectedDate.toString()),
            OutlinedButton(onPressed: selectDate, child: Text("날짜선택")),
            OutlinedButton(onPressed: selectTime, child: Text("시간선택")),
          ],
        ),
      ),
    );
  }
}
