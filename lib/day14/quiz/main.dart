import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../day11/textfield/calculator.dart';
import '../../day12/quiz.dart';
import '../../day9/study/hello.dart';
import '../audio.dart';

void main() => runApp(const MyApp());

List list = [
  "https://www.naver.com",
  "https://www.google.com",
  "https://www.x.com",
  "https://api.flutter.dev",
  "https://api.dart.dev",
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: NaviWidget());
  }
}

class NaviWidget extends StatelessWidget {
  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("quiz 연습"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.door_sliding)),
              Tab(icon: Icon(Icons.masks_sharp)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HelloWidget()),
                      );
                    },
                    child: Text("구구단"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HotelWidget()),
                      );
                    },
                    child: Text("호텔예약"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AudioWidget()),
                      );
                    },
                    child: Text("음악재생"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalTextFieldWidget(),
                        ),
                      );
                    },
                    child: Text("계산기"),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: list
                    .map(
                      (e) => OutlinedButton(
                        onPressed: () {
                          _launchUrl(Uri.parse(e));
                        },
                        child: Text(e),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
