import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ReorderableWidget()));
}

class ReorderableWidget extends StatefulWidget {
  @override
  State<ReorderableWidget> createState() => _ReorderableWidgetState();
}

class _ReorderableWidgetState extends State<ReorderableWidget> {
  List<String> items = ['하나', '둘', '셋', '넷', '다섯'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reorderable List 예제")),
      body: ReorderableListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: List.generate(
          items.length,
          (index) => ListTile(
            key: ValueKey(items[index]), // 꼭 있어야 함!
            title: Text(items[index]),
            tileColor: Colors.lightBlue[200],
          ),
        ),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) newIndex -= 1;
            final item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
