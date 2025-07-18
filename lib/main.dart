import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Map info = {
    'appTitle': "StatelessWidget Demo",
    "appBarTitle": "Flutter Official Site",
    'titleImageLink':
        "https://storage.googleapis.com/cms-storage-bucket/2f118a9971e4ca6ad737.png",
    'titleSectionHeader': 'Flutter on Mobile',
    'titleSectionBody': 'https://flutter.dev/multi-platform/mobile',
    'titleSectionScore': 100,
    'textSection': [
      "동해물과 백두산이 마르고 닳도록\n하느님이 보우하사 우리나라 만세\n무궁화 삼천리 화려 강산\n대한 사람 대한으로 길이 보전하세",
      "남산 위에 저 소나무 철갑을 두른 듯\n바람 서리 불변함은 우리 기상일세\n무궁화 삼천리 화려 강산\n대한 사람 대한으로 길이 보전하세",
      "가을 하늘 공활한데 높고 구름 없이\n밝은 달은 우리 가슴 일편단심일세\n무궁화 삼천리 화려 강산\n대한 사람 대한으로 길이 보전하세",
      "이 기상과 이 맘으로 충성을 다하여\n괴로우나 즐거우나 나라 사랑하세\n무궁화 삼천리 화려 강산\n대한 사람 대한으로 길이 보전하세",
    ],
  };

  @override
  Widget build(BuildContext context) {
    final titleImage = _buildTitleImage(info['titleImageLink']);
    Widget textSection = _buildTextSection(info['textSection']);
    Widget buttonSection = _buildButtonSection(Theme.of(context).primaryColor);
    Widget titleSection = _buildTitleSection(
      info['titleSectionHeader'],
      info['titleSectionBody'],
      info['titleSectionScore'],
    );

    return MaterialApp(
      title: info['appTitle'],
      home: Scaffold(
        appBar: AppBar(title: Text(info['appBarTitle'])),
        body: ListView(
          children: [titleImage, titleSection, buttonSection, textSection],
        ),
      ),
    );
  }
}

Image _buildTitleImage(String imageName) {
  return Image.network(imageName, width: 600, height: 240, fit: BoxFit.cover);
}

Container _buildTitleSection(String name, String addr, int count) {
  return Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(addr, style: TextStyle(color: Colors.grey[500])),
            ],
          ),
        ),
        const Counter(),
      ],
    ),
  );
}

Widget _buildButtonSection(Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconStateBtn(icon: Icons.assistant_navigation, name: 'Visit'),
      IconStateBtn(icon: Icons.add_alert_sharp, name: 'Alarm'),
      IconStateBtn(icon: Icons.share, name: 'Share'),
    ],
  );
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

Container _buildTextSection(List<String> section) {
  return Container(
    padding: const EdgeInsets.all(32),
    child: Column(
      children: [
        for (var i = 0; i < section.length; i++) ...[
          Text(
            "${i + 1}절",
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          Text(
            section[i],
            softWrap: true,
            textAlign: TextAlign.justify,
            style: const TextStyle(height: 1.5, fontSize: 15),
          ),
        ],
      ],
    ),
  );
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
  int _counter = 0;
  bool _boolStatus = false;
  Color _statusColor = Colors.black;

  void _buttonPressed() {
    setState(() {
      if (_boolStatus) {
        _boolStatus = false;
        _counter--;
        _statusColor = Colors.black;
      } else {
        _boolStatus = true;
        _counter++;
        _statusColor = Colors.red;
      }
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _buttonPressed,
          icon: const Icon(Icons.star),
          color: _statusColor,
        ),
        Text('$_counter'),
      ],
    );
  }
}

class IconStateBtn extends StatefulWidget {
  const IconStateBtn({super.key, required this.icon, required this.name});

  final IconData icon;
  final String name;

  @override
  State<IconStateBtn> createState() => _IconBtnState();
}

class _IconBtnState extends State<IconStateBtn> {
  bool _boolStatus = false;
  Color _statusColor = Colors.purple;
  void _IconPressed() {
    setState(() {
      if (_boolStatus) {
        _boolStatus = false;
        _statusColor = Colors.orange;
      } else {
        _boolStatus = true;
        _statusColor = Colors.purple;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: _IconPressed,
          icon: Icon(widget.icon),
          color: _statusColor,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            widget.name,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: _statusColor,
            ),
          ),
        ),
      ],
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   void _DecrementCounter() {
//     setState(() {
//       _counter--;
//     });
//   }

//   String _getMultiply(int dan) {
//     String text = "";
//     for (int i = 1; i <= 9; i++) {
//       text += "$dan X $i = ${dan * i}\n";
//     }

//     return text;
//   }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       title: Text(widget.title),
  //       centerTitle: true,
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           // Column(
  //           //   children: [
  //           //     for (var i = 0; i < 3; i++)
  //           //       Row(
  //           //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           //         children: [
  //           //           for (var j = 1; j <= 3; j++)
  //           //             Text(
  //           //               _getMultiply(i * 3 + j),
  //           //               style: TextStyle(
  //           //                 fontSize: 12,
  //           //                 fontWeight: FontWeight.w600,
  //           //               ),
  //           //             ),
  //           //         ],
  //           //       ),
  //           //   ],
  //           // ),
  //           Text(
  //             '$_counter',
  //             style: Theme.of(context).textTheme.headlineMedium,
  //           ),
  //         ],
  //       ),
  //     ),
  //     floatingActionButton: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         FloatingActionButton(
  //           onPressed: _incrementCounter,
  //           tooltip: 'Increment',
  //           child: const Icon(Icons.add),
  //         ),
  //         Padding(padding: EdgeInsets.all(10)),
  //         FloatingActionButton(
  //           onPressed: _DecrementCounter,
  //           tooltip: 'Decrement',
  //           child: const Icon(Icons.remove),
  //         ),
  //       ],
  //     ),
  //   );
  // }

