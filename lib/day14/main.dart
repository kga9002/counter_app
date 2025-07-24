import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

final Uri _url = Uri.parse('https://flutter.dev');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '외부 라이브러리 설치',
      home: Scaffold(
        appBar: AppBar(title: const Text('외부 라이브러리 설치 및 사용')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "hello~",
                style: GoogleFonts.nanumGothic(
                  textStyle: TextStyle(color: Colors.blue),
                ),
              ),
              ElevatedButton(
                onPressed: _launchUrl,
                child: Text("go to flutter homepage"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
