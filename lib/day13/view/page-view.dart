import 'package:flutter/material.dart';

void main() => runApp(PageViewWidget());

class PageViewWidget extends StatelessWidget {
  PageViewWidget({super.key});

  var pagecontroller = PageController();

  @override
  void dispose() {
    pagecontroller.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("page view 연습")),
      body: PageView(
        children: [
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.blue),
        ],
      ),
    );
  }
}
