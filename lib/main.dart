import 'package:flutter/material.dart';
import 'book.dart';
import 'hello.dart';
import "star.dart";
import 'colorWidget.dart';

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
  final List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    Colorwidget(),
    StarWidget(),
  ];

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
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.palette),
                    label: "Color",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.star),
                    label: "Star",
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                onTap: _onItemTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
