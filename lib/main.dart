import 'package:flutter/material.dart';
import 'day9/study/book.dart';
import 'day9/study/hello.dart';
import "day9/study/star.dart";
import 'day9/study/colorWidget.dart';
import 'day11/textfield/normal.dart';
import 'day11/textfield/number.dart';
import 'day11/textfield/quiz.dart';
import 'day11/textfield/password.dart';
import 'day11/textfield/button-input.dart';
import 'day11/textfield/calculator.dart';
import 'day9/study/note.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _title = "Flutter 예제";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title, home: const MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<StatefulWidget> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<StatefulWidget> {
  Color currentColor = Colors.red;
  void changeColor(MapEntry<String, Color> object) {
    setState(() {
      currentColor = object.value;
    });
  }

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      // HomeWidget(),
      // Colorwidget(onPressed: changeColor),
      // HelloWidget(),
      // StarWidget(),
      NormalTextFieldWidget(),
      // NumberTextFieldWidget(),
      // QuizWidget(),
      // PassWordTextFieldWidget(),
      NoteTextFieldWidget(),
      ButtonInputTextFieldWidget(), CalTextFieldWidget(),
    ];
  }

  final PageController _pageController = PageController();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter 예제")),
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            Scaffold(
              body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.home),
            //   label: "Home",
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.palette),
            //   label: "Color",
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.handshake),
            //   label: "Hello",
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.star),
            //   label: "Star",
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.text_fields),
              label: "기본입력창",
            ),
            // BottomNavigationBarItem(icon: Icon(Icons.numbers), label: "숫자입력창"),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.question_mark),
            //   label: "quiz",
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.security_update),
            //   label: "pw",
            // ),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: "note"),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: "123"),
            BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "cal"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          backgroundColor: currentColor,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
