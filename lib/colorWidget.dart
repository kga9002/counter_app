import 'package:flutter/material.dart';

class Colorwidget extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Colorwidget> {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: colors.entries.toList()[i].value,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  colors.entries.toList()[i].value ==
                                      Colors.black
                                  ? Colors.white
                                  : Colors.black,
                              width: 3.0,
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
      ),
    );
  }
}
