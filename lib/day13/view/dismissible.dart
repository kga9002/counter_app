import 'package:flutter/material.dart';

class DismissibleWidget extends StatelessWidget {
  const DismissibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("dismissible 연습")),
      body: Dismissible(
        key: Key("item 1"),
        child: ListTile(title: Text("Swipe me")),
        // confirmDismiss: (direction) {
        //   return showDialog(context: context, builder: (context) {});
        // },
        onDismissed: (direction) {
          print("deleted");
        },
      ),
    );
  }
}
