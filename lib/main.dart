import 'package:counter_app/day13/button/elevated.dart';
import 'package:counter_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'day12/quiz.dart';
import 'day13/button/textbtn.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("초기화 완료");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Firebase Auth Demo', home: AuthPage());
  }
}

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key});

//   @override
//   State<StatefulWidget> createState() => MyStatefulWidgetState();
// }

// class MyStatefulWidgetState extends State<StatefulWidget> {
//   Color currentColor = Colors.red;
//   void changeColor(MapEntry<String, Color> object) {
//     setState(() {
//       currentColor = object.value;
//     });
//   }

//   late List<Widget> _widgetOptions;

//   @override
//   void initState() {
//     super.initState();
//     _widgetOptions = <Widget>[
//       HotelWidget(),
//       ElevatedBtnWidget(),
//       TextBtnWidget(),
//     ];
//   }

//   final PageController _pageController = PageController();

//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   static const TextStyle optionStyle = TextStyle(
//     fontSize: 30,
//     fontWeight: FontWeight.bold,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text("Flutter 예제")),
//         body: PageView(
//           controller: _pageController,
//           children: <Widget>[
//             Scaffold(
//               body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
//             ),
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(icon: Icon(Icons.hotel), label: "hotel"),
//             BottomNavigationBarItem(icon: Icon(Icons.hotel), label: "btn"),
//             BottomNavigationBarItem(icon: Icon(Icons.hotel), label: "textbtn"),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.white,
//           backgroundColor: currentColor,
//           type: BottomNavigationBarType.fixed,
//           onTap: _onItemTapped,
//         ),
//       ),
//     );
//   }
// }

class _AuthPageState extends State<AuthPage> {
  final DatabaseReference _ref = FirebaseDatabase.instance.ref("user");

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String message = '';

  Future<void> signUp() async {
    print("버튼 눌림");
    try {
      await _ref.set({
        "email": emailController.text,
        "password": passwordController.text,
      });
      setState(() {
        message = '회원가입 성공!';
      });
    } catch (e) {
      setState(() {
        message = '회원가입 실패: $e';
      });
    }
  }

  // Future<void> signIn() async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //     setState(() {
  //       message = '로그인 성공!';
  //     });
  //   } catch (e) {
  //     setState(() {
  //       message = '로그인 실패: $e';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Auth')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: '이메일'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: '비밀번호'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: signUp, child: const Text('회원가입')),
            // ElevatedButton(onPressed: signIn, child: const Text('로그인')),
            const SizedBox(height: 20),
            Text(message),
          ],
        ),
      ),
    );
  }
}
