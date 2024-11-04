import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    return ListView(
      children: [
          _buildTop(),
          _buildMiddle(),
          _buildBottom(),
      ],
    );
  }

  Widget _buildTop(){
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 각 위젯의 간격 조절을 잘해줌
            children: [
              GestureDetector(
                onTap: () {
                  print('클릭');
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
              ),
              Column(
                children: [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
            ],
          ),
          SizedBox( // 각 Row 간의 간격을 정해줌
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 각 위젯의 간격 조절을 잘해줌
            children: [
              Column(
                children: [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
              Opacity(
                opacity: 0.0,
                child: Column(
                  children: [
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiddle(){
    final imgList = [
      'data:image/jpeg;base64,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',
      'data:image/jpeg;base64,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',
      'data:image/jpeg;base64,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',
    ];
    return CarouselSlider(
      options: CarouselOptions(
          height: 300,
          autoPlay: true,
      ),
      items: imgList.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width, // 기기의 정보를 얻는 클래스,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.amber
              ),
              child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              );
          },
        );
      }).toList(),
    );
  }

  Widget _buildBottom(){
    return Text('Bottom');
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
