import 'package:flutter/material.dart';

import 'day12/input/checkbox.dart';
import 'day12/input/datepicker.dart';
import 'day12/input/dropdown.dart';
import 'day12/input/radio.dart';
import 'day12/input/slider.dart';
import 'day12/input/switch.dart';
import 'day12/quiz.dart';

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
      SwtichWidget(),
      CheckBoxWidget(),
      RadioWidget(),
      SliderWidget(),
      DropdownWidget(),
      DatePickerWidget(),
      HotelWidget(),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.switch_access_shortcut),
              label: "swtich",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box),
              label: "checkbox",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_checked_outlined),
              label: "radio",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.slideshow_rounded),
              label: "slider",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_drop_down),
              label: "dropdown",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "datepicker",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.hotel), label: "hotel"),
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
