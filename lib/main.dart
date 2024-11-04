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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // appBar는 상단에 표시되는 앱바를 말함
        title: Text('복잡합 UI'), // title은 상단 앱바에 표시됨
      ),
      body: Center( // body는 화면의 주요 콘텐츠가 위치하는 부분 , Center는 중앙으로 정렬시켜주는 위젯
        child: Text(
          '$_index 페이지',
          style: TextStyle(fontSize: 40),
        ),
      ),
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
