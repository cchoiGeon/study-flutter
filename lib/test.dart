import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildTop(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildMiddle(),
          Expanded(child: _buildBottom()),
        ],
      ),
      bottomNavigationBar: _navigationBar(),
    );
  }
  PreferredSizeWidget _buildTop() {
    return AppBar(
        centerTitle: false, // 제목을 왼쪽 정렬
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('연속출석 12일'),
            Text('2024년 4월 2일'),
          ]
        )
    );
  }
  Widget _buildMiddle() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "오늘의 문제",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text("쉬운 것부터 어려운 것까지\n 다양한 미니게임으로 두뇌를\n 트레이닝 해보세요!"),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  alignment: Alignment.center, // 아이콘을 중앙에 배치
                  child: Image.asset(
                      'images/a.jpeg',
                      width: 200, // 원하는 너비
                      height: 200, // 원하는 높이
                      fit: BoxFit.cover, // 이미지의 비율을 유지하며 꽉 채우기
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }

  Widget _buildBottom() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0), // 테두리 설정
                  borderRadius: BorderRadius.circular(8), // 둥근 모서리 설정 (옵션)
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("게임이름", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("기억력", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0), // 테두리 설정
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("게임이름", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("집중력", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FourthPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0), // 테두리 설정
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("게임이름", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("문제해결", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FourthPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0), // 테두리 설정
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("다양한 훈련으로\n두뇌능력을 향상시켜 보세요", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _navigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '오늘',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '기록',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '전체게임',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '설정',
        ),
      ],
      currentIndex: 0, // 기본 선택된 인덱스 (예: 첫 번째 탭)
      selectedItemColor: Colors.blue, // 선택된 아이템 색상
      unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('이전 페이지로'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('이전 페이지로'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('이전 페이지로'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
