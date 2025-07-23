import 'package:counter_app/day13/button/elevated.dart';
import 'package:flutter/material.dart';
import 'day12/quiz.dart';
import 'day13/button/textbtn.dart';

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
      HotelWidget(),
      ElevatedBtnWidget(),
      TextBtnWidget(),
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
            BottomNavigationBarItem(icon: Icon(Icons.hotel), label: "hotel"),
            BottomNavigationBarItem(icon: Icon(Icons.hotel), label: "btn"),
            BottomNavigationBarItem(icon: Icon(Icons.hotel), label: "textbtn"),
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
