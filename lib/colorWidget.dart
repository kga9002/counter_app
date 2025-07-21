import 'package:flutter/material.dart';

class Colorwidget extends StatefulWidget {
  final void Function(MapEntry<String, Color>) onPressed;

  Colorwidget({required this.onPressed, Key? key}) : super(key: key);

  @override
  _ColorwidgetState createState() => _ColorwidgetState();
}

class _ColorwidgetState extends State<Colorwidget> {
  Map<String, Color> colors = {
    "빨강": Colors.red,
    "주황": Colors.orange,
    "노랑": Colors.yellow,
    "초록": Colors.green,
    "파랑": Colors.blue,
    "남색": const Color.fromARGB(255, 0, 2, 95),
    "보라": Colors.purple,
    "흰색": Colors.white,
    "검정": Colors.black,
  };

  late MapEntry<String, Color> currentColor = colors.entries.first;

  void onClickContainer(MapEntry<String, Color> color) {
    setState(() {
      currentColor = color;
    });
  }

  void showAlertDialog(
    BuildContext context,
    MapEntry<String, Color> colorMap,
  ) async {
    String result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(colorMap.key),
          content: Text("${colorMap.key}로 변경하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                onClickContainer(colorMap);
                widget.onPressed(colorMap);
                Navigator.pop(context, "닫기");
              },
              child: Text("OK"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, "닫기");
              },
              child: Text("닫기"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("좋아하는 색 고르기")),
      backgroundColor: currentColor.value,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  for (int i = 0; i < colors.length; i++)
                    GestureDetector(
                      onTap: () {
                        onClickContainer(colors.entries.toList()[i]);
                        widget.onPressed(colors.entries.toList()[i]);
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: colors.entries.toList()[i].value,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:
                                colors.entries.toList()[i].value == Colors.black
                                ? Colors.white
                                : Colors.black,
                            width: 3.0,
                          ),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              showAlertDialog(
                                context,
                                colors.entries.toList()[i],
                              );
                            },
                            child: Text(
                              colors.entries.toList()[i].key,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Text(
              "현재 선택한 색상은 .... ${currentColor.key}",
              style: TextStyle(
                fontSize: 20,
                color: currentColor.value == Colors.black
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
