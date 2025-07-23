import 'package:flutter/material.dart';

void main() => runApp(const TabBarWidget());

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Listview 연습"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.cloud)),
              Tab(icon: Icon(Icons.sunny)),
              Tab(icon: Icon(Icons.wind_power)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("cloud")),
            Center(child: Text("sunny")),
            Center(child: Text("windy")),
          ],
        ),
      ),
    );
  }
}
