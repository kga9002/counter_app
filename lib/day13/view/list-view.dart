import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listview 연습")),
      body: ListView(
        children: [
          ListTile(title: Text("item 1")),
          ListTile(title: Text("item 2")),
          ListTile(title: Text("item 3")),
        ],
      ),
    );
  }
}
