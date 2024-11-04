import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0; // 페이지 인덱스 0,1,2 기본값 : 0
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // appBar는 상단에 표시되는 앱바를 말함
        backgroundColor: Colors.white, // 배경색
        title: Text('복잡합 UI'), // title은 상단 앱바에 표시됨
        actions: [ // 앱바 오른쪽에 메뉴 추가
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        centerTitle: true, // 제목을 가운데로
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar( // 바텀 네비게이션바
        onTap: (index) { // 해당 목록을 눌렀을 때 동작 처리, 현재 선택된 탭의 인덱스가 전달
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index, // 선택된 인덱스, 이걸 설정해야 해당 아이콘을 눌렀을 때 해당 아이콘 색이 바뀐다. 어디 인덱스인지 색을 통해 알려줌
        items: [ // 위젯 리스트 정의
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: '이용 서비스',
            icon: Icon(Icons.assignment)
          ),
          BottomNavigationBarItem(
            label: '내 정보',
            icon: Icon(Icons.account_circle)
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '홈페이지',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '이용서비스',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '내 정보',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
