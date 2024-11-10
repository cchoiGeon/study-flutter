import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI 자서전',
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
      body: Column(
        children: [
          _buildMain(),
          _buildLogin(),
        ],
      ),
    );
  }
  Widget _buildMain() {
    return Padding(
      padding: const EdgeInsets.only(top: 150,bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "LIFE LEFACY",
              style: TextStyle(fontSize: 40),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text("AI와 음성인식 기술을 활용한\n맞춤형 자서전 제작 서비스"),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // 버튼 배경색 설정
                    foregroundColor: Colors.white,     // 글자 색
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),  // 모서리를 살짝 둥글게
                    ),
                  ),
                  child: Text(
                    '자서전 작성',
                    style: TextStyle(),
                  ),
                  onPressed: () {
                    // 실행될 코드 작성
                  }
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),  // 모서리를 살짝 둥글게
                    ),
                  ),
                  child: Text('자서전 보기'),
                  onPressed: () {
                    // 실행될 코드 작성
                  }
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget _buildLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 400,
          height: 40,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),  // 모서리를 살짝 둥글게
                ),
              ),
              child: Text(
                '로그인',
                style: TextStyle(),
              ),
              onPressed: () {
                // 실행될 코드 작성
              }
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 400,
          height: 40,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),  // 모서리를 살짝 둥글게
                ),
              ),
              child: Text(
                '회원가입',
                style: TextStyle(),
              ),
              onPressed: () {
                // 실행될 코드 작성
              }
          ),
        ),
      ],
    );
  }
}
