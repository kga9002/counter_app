import 'package:flutter/material.dart';

class HelloWidget extends StatelessWidget {
  HelloWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 32),
            ),
            onPressed: () {
              showAlertDialog(context);
            },
            child: const Text("Hello Press here"),
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Sample'),
          content: const Text("Select button you want"),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context, "OK");
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, "Cancel");
              },
            ),
          ],
        );
      },
    );
  }
}
