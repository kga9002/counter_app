import 'package:flutter/material.dart';

class HelloWidget extends StatelessWidget {
  HelloWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("구구단")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            for (int i = 1; i <= 9; i++)
              Center(
                child: TextButton(
                  onPressed: () {
                    showAlertDialog(context, i);
                  },
                  child: Text(
                    "$i단",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context, int dan) async {
    String multiply = "";
    for (int i = 1; i <= 9; i++) {
      multiply += "$dan X $i = ${i * dan}\n";
    }
    String result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("$dan단"),
          content: Text(multiply),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context, "OK");
              },
            ),
          ],
        );
      },
    );
  }
}
