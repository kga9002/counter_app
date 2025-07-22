import 'package:flutter/material.dart';

import 'breakfast.dart';

void main() {
  return runApp(CustomerNameWidget(data: {}));
}

class CustomerNameWidget extends StatefulWidget {
  final Map data;

  CustomerNameWidget({required this.data});

  @override
  State<CustomerNameWidget> createState() => CustomerNameWidgetState();
}

class CustomerNameWidgetState extends State<CustomerNameWidget> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "이름을 입력하세요",
                  border: OutlineInputBorder(),
                ),
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
                    if (controller.text != "") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BreakfastWidget(
                            data: {...widget.data, "name": controller.text},
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
