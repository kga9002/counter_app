import 'package:flutter/material.dart';

void main() => runApp(const GridViewWidget());

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("gridview 연습")),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Center(child: Text("item 1")),
          Center(child: Text("item 2")),
          Center(child: Text("item 3")),
        ],
      ),
    );
  }
}
