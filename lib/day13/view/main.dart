import 'package:counter_app/day13/view/reorderable.dart';
import 'package:flutter/material.dart';

import 'dismissible.dart';
import 'grid-view.dart';
import 'list-view.dart';
import 'page-view.dart';
import 'single-child-scroll-view.dart';
import 'tabbar.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _title = 'Flutter 예제';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title, home: const MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  int number = 12431243;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter 예제')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListViewPage()),
              );
            },
            child: Text("List view"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GridViewWidget()),
              );
            },
            child: Text("grid view"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SingleChildWidget()),
              );
            },
            child: Text("single child view"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageViewWidget()),
              );
            },
            child: Text("page view"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TabBarWidget()),
              );
            },
            child: Text("tabbar view"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DismissibleWidget()),
              );
            },
            child: Text("dismissible view"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReorderableWidget()),
              );
            },
            child: Text("reorderable view"),
          ),
        ],
      ),
    );
  }
}
