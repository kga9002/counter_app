// Material 이라고 부르는 안드로이드 운영체제 전용 그래픽 라이브러리
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeName = const Text(
      "롯데리아",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: "Roboto",
        letterSpacing: 0.5,
        fontSize: 25,
      ),
    );

    final description = Text(
      "이 가게의 이름은 롯데리아이고, 햄버거가 맛있고 감튀가 제일 맛있음... 진짜요...?",
    );

    // 가게 이름과 설명을 합친 그룹을 하나 만들자!
    final storeGroup = Container(
      // 좌우 여백을 주는 기능
      padding: const EdgeInsets.all(20), // 좌우는 항상 20의 여백을 가지고 있을거야
      child: Column(children: [storeName, description]),
    );

    final item1 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.black),
      ],
    );

    final item2 = const Text(
      '170 Reviewers',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        fontSize: 20,
      ),
    );

    final item3 = Icon(Icons.kitchen, color: Colors.green[500]);

    final item4 = Icon(Icons.timer, color: Colors.green[500]);

    final item5 = Icon(Icons.restaurant, color: Colors.green[500]);

    final item6 = const Text('kitchen:');

    final item7 = const Text('timer:');

    final item8 = const Text('restaurant:');

    final group1 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [item1, item2],
    );

    final group3 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [item4, item7],
    );

    final group4 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [item5, item8],
    );

    final group2 = DefaultTextStyle.merge(
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: "Roboto",
        letterSpacing: 0.5,
        fontSize: 18,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [item3, item6],
          ),
          group3,
          group4,
        ],
      ),
    );

    // Container : 범위를 지정해서 그 범위 내의 스타일 또는 여백 등등을 지정해주는 클래스
    // 그렇기 때문에 한 가지 위젯만 담을 수 있음
    // 한 가지 위젯만 담는다 -> child (단수형)
    // 여러 가지 위젯을 담을 수 있다 -> children (복수형)
    final groupAggregated = Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(padding: const EdgeInsets.all(20), child: group1),
          group2,
        ],
      ),
    );

    // 가게 이름을 맨 위에 띄워보자!
    // 가게 이름과 group1, group2 의 바로 위에 올라갈 수 있게 만들어보자.
    // 그룹으로 하나로 묶어줘야 얘네가 같이 붙을 수 있겠구나!
    // 설명까지 작성하고 나니, 설명이 화면을 전체 가로에 적혀있어서 투박하네.
    // 이걸 좌우 여백을 줘서 좀더 이쁘게 만들어보자!

    final nameGroup = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [storeGroup, groupAggregated],
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [nameGroup],
      ),
    );
  }
}
